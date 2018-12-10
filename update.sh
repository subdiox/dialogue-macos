#!/bin/bash

if [ $# -ne 1 ]; then
	echo "[Error] This script needs filename as argument."
	exit
fi

nkf -e asr/grammar/$1.yomi | yomi2voca | nkf -w >| asr/grammar/$1.voca
mkdfa asr/grammar/$1
generate asr/grammar/$1
