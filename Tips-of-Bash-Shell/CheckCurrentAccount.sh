#! /usr/bin/bash

UserName="xxx"

if [ "&UserName" != `whoami` ]; then
    echo "The current account is invalid!"
    exit 1
fi
