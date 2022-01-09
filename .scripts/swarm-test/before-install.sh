#!/bin/bash

WORKDIR="~/project"

# CLEANUP
[ -d $WORKDIR ] && sudo rm -rf $WORKDIR || echo "FOLDER NOT EXIST"