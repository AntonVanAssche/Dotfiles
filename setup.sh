#!/bin/bash

# Repo info
declare -r GITHUB_REPOSITORY="AntonVanAssche/dotfiles"
declare -r GITHUB_REPOSITORY_URL="https://github.com/$GITHUB_REPOSITORY"

declare dotfilesDirectory="$HOME/Projects/dotfiles"

# Colors
declare normal="$(tput sgr0 2> /dev/null)"
declare red="$(tput setaf 1 2> /dev/null)"
declare green="$(tput setaf 2 2> /dev/null)"
declare yellow="$(tput setaf 3 2> /dev/null)"
declare blue="$(tput setaf 4 2> /dev/null)"

Header() {

cat << "EOF"

                              █▀▀▀ ▀█▀ █    █▀▀ █▀▀
                              █▀▀   █  █    █▀▀ ▀▀█
                            ▀ ▀    ▀▀▀ ▀▀▀  ▀▀▀ ▀▀▀

    Press ENTER or wait 5 seconds to begin the installation (CTRL + C to abort):
EOF
    read -r -s -n1 -t5
}

DownloadDotfiles() {
    printf "%b" "\n${blue} • Download${normal}\n"

    command -v git &> /dev/null || sudo dnf install -y git &> /dev/null
    Execute "git clone --quiet --recursive $GITHUB_REPOSITORY_URL $dotfilesDirectory" "Cloning dotfiles"

    cd "${dotfilesDirectory}/" || exit 1
}

# Ask for the administrator password upfront.
AskForSudo() {
    sudo -v -p "    [?] Enter Your password to continue: "
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done &> /dev/null &
}

# Colors
PrintResult() {
    if [ "$1" -eq 0 ]; then
        PrintSuccess "$2"
    else
        PrintError "$2"
    fi

    return "$1"
}

PrintSuccess() {
    printf "%b" "    [${green}✔${normal}] $1\n"
}

PrintWarning() {
    printf "%b" "    [${yellow}!${normal}] $1\n"
}

PrintError() {
    printf "%b" "    [${red}✖${normal}] $1 $2\n"
}

KillAllSubprocesses() {
    local i=""

    for i in $(jobs -p); do
        kill "$i"
        wait "$i" &> /dev/null
    done
}

Execute() {
    local -r CMDS="$1"
    local -r MSG="${2:-$1}"
    local -r TMP_FILE="$(mktemp /tmp/XXXXX)"

    local exitCode=0
    local cmdsPID=""

    # If the current process is ended,
    # also end all its subprocesses.

    SetTrap "EXIT" "KillAllSubprocesses"

    # Execute commands in background
    # shellcheck disable=SC2261

    eval "$CMDS" &> /dev/null 2> "$TMP_FILE" &

    cmdsPID=$!

    # Show a spinner if the commands
    # require more time to complete.

    Spinner "$cmdsPID" "$CMDS" "$MSG"

    # Wait for the commands to no longer be executing
    # in the background, and then get their exit code.

    wait "$cmdsPID" &> /dev/null
    exitCode=$?

    # Print output based on what happened.

    PrintResult $exitCode "$MSG"

    return $exitCode
}

SetTrap() {

    trap -p "$1" | grep "$2" &> /dev/null || trap '$2' "$1"

}

Spinner() {
    local -r FRAMES='/-\|'

    # shellcheck disable=SC2034
    local -r NUMBER_OR_FRAMES=${#FRAMES}

    local -r CMDS="$2"
    local -r MSG="$3"
    local -r PID="$1"

    local i=0
    local frameText=""

    # Note: In order for the Travis CI site to display
    # things correctly, it needs special treatment, hence,
    # the "is Travis CI?" checks.
    if [ "$TRAVIS" != "true" ]; then

        # Provide more space so that the text hopefully
        # doesn't reach the bottom line of the terminal window.
        #
        # This is a workaround for escape sequences not tracking
        # the buffer position (accounting for scrolling).
        #
        # See also: https://unix.stackexchange.com/a/278888
        printf "\n\n\n"
        tput cuu 3
        tput sc
    fi

    # Display spinner while the commands are being executed.
    while kill -0 "$PID" &>/dev/null; do
        frameText="    [${FRAMES:i++%NUMBER_OR_FRAMES:1}] $MSG"

        # Print frame text.
        if [ "$TRAVIS" != "true" ]; then
            printf "%s\n" "$frameText"
        else
            printf "%s" "$frameText"
        fi

        sleep 0.2

        # Clear frame text.
        if [ "$TRAVIS" != "true" ]; then
            tput rc
        else
            printf "\r"
        fi
     done
}

PackageIsInstalled() {
    dnf list installed | grep "${1}" &> /dev/null
}

InstallPackage() {
    if ! PackageIsInstalled "${1}"; then
        Execute "sudo dnf install ${1} -y" "${2}"
    else
        PrintSuccess "Already installed ${1}"
    fi
}

RemovePackage() {
    if PackageIsInstalled "${1}"; then
        Execute "sudo dnf remove ${1} -y" "${2}"
    else
        PrintSuccess "Isn't installed ${1}"
    fi
}

Update() {
    Execute "sudo dnf update -y" "DNF (update)"
}

CleanUp() {
    Execute "sudo dnf autoremove -y" "DNF (autoremove)"
    Execute "sudo dnf clean all" "DNF (clean)"
    Execute "rm -rf gnoti/ adw-gtk3/ firefox-gnome-theme/ spotifyd" "Removing temporary files/directories"
}

VerifyOS() {
    local OS
    OS="$(. "/etc/os-release" && printf "%s" "$NAME")"

    if [[ $OS != "Fedora Linux" ]]; then
        PrintError "Your operating system '${OS}' is not supported."
        exit 1
    fi
}

Main() {
    # Show the header.
    Header

    # Ensure that the following actions
    # are made relative to this file's path.
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

    # Ensure the OS is supported and
    # it's above the required version.
    VerifyOS || exit 1

    # Ask for the sudo pasword upfront.
    AskForSudo

    # Check if this script was run directly (./<path>/setup.sh),
    # and if not, it most likely means that the dotfiles were not
    # yet set up, and they will need to be downloaded.
    printf "%s" "${BASH_SOURCE[0]}" | grep "setup.sh" &> /dev/null || DownloadDotfiles

    # Create some directories.
    source ./setup/dotfiles/dirs.sh

    # Check if installing via one-liner.
    [[ $(pwd) != "$HOME/git/github/dotfiles/" ]] && cp -r ../dotfiles/ "$HOME"/Projects/dotfiles/ &> /dev/null

    # Install the dotfiles by creating a symlink.
    source ./setup/dotfiles/dotfiles.sh

    # Install fonts
    source  ./setup/fonts/fonts.sh

    # Install all the packages I use for daily use.
    printf "%b" "\n${blue} • Packages${normal}\n"
    Execute "sudo cp -r ./src/dnf/dnf.conf /etc/dnf/dnf.conf" "Updating DNF config"

    printf "%b" "\n${blue} • Install rpmfusion ${normal}\n"

    InstallPackage "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm" "Installing rpmfusion-free"
    InstallPackage "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm" "Installing rpmfusion-nonfree"

    printf "%b" "\n${blue} • Update system${normal}\n"
    Update

    for script in ./setup/packages/*.sh;
    do
        source "${script}"
    done

    if command -v "gnome-shell" &> /dev/null; then
        # Configure Gnome-Shell.
        printf "%b" "\n${blue} • Configuring Gnome-Shell${normal}\n"

        for script in ./setup/gnome/*.sh;
        do
            source "${script}"
        done
    fi
    printf "%b" "\n${blue} • Clean up system${normal}\n"
    CleanUp
}

Main "$@"
