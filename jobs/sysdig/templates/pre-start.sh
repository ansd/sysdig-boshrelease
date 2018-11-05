#!/bin/bash -ex

MODULE="sysdig_probe"
if lsmod | grep "$MODULE" &> /dev/null ; then
  echo "$MODULE is already loaded"
  exit 0
fi

echo "$MODULE is not loaded. Loading..."
insmod /var/vcap/packages/sysdig/sysdig-probe.ko
