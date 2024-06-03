#!/bin/bash

currentTTY="$(printf '%s' "${1}" | rev | cut -d'/' -f1 | rev)"
sshHost=$(ps -t "${currentTTY}" | sed -n -e 's/^.*\(ssh\) //p' | sed -n -e 's/^.*@//p' | cut -f1 -d' ')
moshHost=$(ps -t "${currentTTY}" | sed -n -e 's/^.*\(mosh-client\) \(-# \)//p' | cut -d ' ' -f1)

if [[ -n "${sshHost}" ]]; then
  printf '💻 %s' "${sshHost}"
elif [[ -n "${moshHost}" ]]; then
  printf '💻 %s' "${moshHost}"
else
	printf '💻 %s' "$(hostname -s)"
fi
