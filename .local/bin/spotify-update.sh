#!/usr/bin/env bash

set -o errexit  # Abort on nonzero exit code.
set -o nounset  # Abort on unbound variable.
set -o pipefail # Don't hide errors within pipes.
# set -o xtrace # Enable for debugging.

sudo chmod a+wr /lib64/spotify-client/
sudo chmod a+wr /lib64/spotify-client/Apps/ -R

spicetify update
spicetify restore backup apply
