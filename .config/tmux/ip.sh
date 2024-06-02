#!/bin/bash

wanTmp="/tmp/wanIP"
updateTime=900
tickFile="/tmp/tmux_ip_tick"

lanIP() {
   printf '%s' "$(/sbin/ifconfig 2>/dev/null | grep 'inet '|grep -v '127.0.0.1'| awk '{print $2}'|cut -d':' -f2|head -1)"
}

grabWanIP() {
   ip="$(curl ifconfig.me 2>/dev/null)"
   printf '%s' "${ip}" > ${wanTmp}
}

wanIP() {
   if [[ -f ${wanTmp} ]]; then
      wanFileWritten=$(date +%s -r ${wanTmp})
      now=$(date +%s)
      wanFileAge=$((now-wanFileWritten))
      if [[ ${wanFileAge} -gt ${updateTime} ]]; then
         grabWanIP
      fi
   else
      grabWanIP
   fi
   cat ${wanTmp}
}

printIP() {
  printf "%-17s" "${1}"
}

if [[ -f "${tickFile}" ]] && [[ $(cat ${tickFile}) -gt 0 ]]; then
  printf "0" > "${tickFile}"
  printIP "🌎 $(wanIP)"
else
  printf "1" > "${tickFile}"
  printIP "🏡 $(lanIP)"
fi
