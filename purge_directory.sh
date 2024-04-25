#!/bin/bash
#purge_directory.sh

set -e

#input
_path=$1
_daystokeep=$2


if [ ! -z "$_path" ] && [ ! -z "$_daystokeep" ];
	then
		_mtime="$((_daystokeep-1))"
		find "$_path" -type f -mtime +"$_mtime" -exec rm -f {} +
	else
		echo "missing input parameters";
fi
