#!/bin/sh
export PATH=/usr/local/bin:${PATH}

pb=/var/portbuild
config_file=${pb}/conf/server.conf

if [ ! -f ${config_file} ]; then
  echo "$0: ${config_file} must exist!"
  exit 1
fi

. ${config_file}

case $1 in
    start)
        s=${pb}/qmanager/qmanager.py
        if [ -x $s ]; then
            running=`ps ax | grep -v grep | grep $s`
            if [ -z "${running}" ]; then
                ${s} &
                echo -n ' qmanager'
            else
                echo "qmanager already running"
            fi
        fi

        ;;
    stop)
        # XXX
        ;;
esac
echo