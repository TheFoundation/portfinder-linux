#!/bin/bash
#
# Please run as root.
# Usage: bash findport.sh 3000 100
#


if [[ -z "$1" || -z "$2" ]]; then
  echo "Usage: $0 <min_port> <max_port>"
  exit 1
fi


BASE=$1
INCREMENT=1
END=$2

port=$BASE
isfree=$(netstat -tapln | grep $port)

while [[ -n "$isfree" ]]; do
  port=$[port+INCREMENT]
  isfree=$(netstat -tapln | grep $port)
  if [[ "$port" -eq "$END" ]] ;then echo no free ports >&2 ; exit 4; fi
done

echo "$port"
exit 0
