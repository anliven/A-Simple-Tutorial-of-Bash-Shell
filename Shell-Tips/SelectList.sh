#!/bin/bash

function show_help(){
  echo "Usage:"
  echo "    ./$0 -h                  Show help infomation"
  echo "    ./$0 configure <file>    Configure services for server."
  echo "    ./$0 check <file>        Check configuration."
  echo "    ./$0 clean <file>        Clean configuration. Use this option with CAUTION!"     
}

while getopts ":h" opt; do
  case ${opt} in
    h) 
	  show_help
      exit 0;;
    \?) 
	  echo "Invalid option: $OPTARG" 1>&2
      show_help
      exit 1;;
  esac
done

if [ $# -ne 2 ];then
  echo "Invalid parameter!"
  show_help
  exit 1
fi

subcommand=$1
case "$subcommand" in
  configure) operation=$1;;
  check) operation=$1;;
  clean) operation=$1;;
  *) show_help
     exit 1;;
esac

function run_action() {
  echo "Run action : ./$0 $operation $file"
}

file=$2
if [ -f $file ];then
  if [ "$operation" == "clean" ];then
    echo "Clean all cofiguration. Continue(Yes/No)?"
    read continue
    if [ "$continue" != "Yes" ];then
      echo "Not Yes, the script exits."
      exit 0
    fi
  fi
  run_action
else
  echo "File:$2 can't be found."
  exit 1
fi