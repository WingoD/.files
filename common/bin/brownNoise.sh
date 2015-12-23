#!/bin/sh
 
len='7:00:00'
vol=1
 
if [ "$1" != '' ]; then
  len=$1
fi
 
if [ "$2" != '' ]; then
  vol=$2
fi
 
play -v $vol -t sl - synth $len  brownnoise band -n 1200 200 tremolo .1 40 < /dev/zero
