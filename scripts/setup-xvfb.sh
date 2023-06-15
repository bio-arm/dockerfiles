#!/usr/bin/env bash

# install Xvfb
dnf install -y xorg-x11-server-Xvfb

cat << EOT > /etc/init.d/xvfb
#! /bin/sh
### BEGIN INIT INFO
# Provides:          Xvfb
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Loads X Virtual Frame Buffer
# Description:       This file should be used to construct scripts to be
#                    placed in /etc/init.d.
#
#                    A virtual X server is needed to non-interactively run
#                    'R CMD build' and 'R CMD check on some BioC packages.
#                    The DISPLAY variable is set in /etc/profile.d/xvfb.sh.
### END INIT INFO

XVFB=/usr/bin/Xvfb
XVFBARGS=":1 -screen 0 800x600x16"
PIDFILE=/var/run/xvfb.pid
case "$1" in
  start)
    echo -n "Starting virtual X frame buffer: Xvfb"
    start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile --background --exec $XVFB -- $XVFBARGS
    echo "."
    ;;
  stop)
    echo -n "Stopping virtual X frame buffer: Xvfb"
    start-stop-daemon --stop --quiet --pidfile $PIDFILE
    sleep 2
    rm -f $PIDFILE
    echo "."
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "Usage: /etc/init.d/xvfb {start|stop|restart}"
    exit 1
esac

exit 0
EOT

chmod 755 /etc/init.d/xvfb

#cat << EOT >> /etc/systemd/system/Xvfb.service
#[Unit]
#Description=X Virtual Frame Buffer Service
#After=network.target

#[Service]
#Environment="DISPLAY=:1.0"
#ExecStart=/usr/bin/Xvfb :1.0 -screen 0 800x600x16

#[Install]
#WantedBy=multi-user.target
#EOT

#systemctl enable Xvfb.service
#systemctl start Xvfb.service
