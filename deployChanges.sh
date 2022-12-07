#!/bin/#!/usr/bin/env bash

help()
{
    echo "Usage: ./deployChanges.sh <config name> <stack-name>"
}

perform_build()
{
    #clear everything first
    find . -name ".aws-sam" -prune -exec rm -r "{}" \;

}

if [ $# -lt 2 ]; then
    help
    exit 1
fi

perform_build

sam deploy "$@" --config-env $1 --stack-name $2
if [ $? -ne 0 ]; then
    echo
    echo "Deployment Failed.. exiting.."
    echo
    exit 1
fi

