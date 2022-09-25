#!/bin/bash

PLUGIN_NAME="melee-friendly-fire"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx
