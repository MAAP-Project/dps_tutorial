#!/bin/bash

# This script is used to install any custom packages required by the algorithm.

# Get current location of build script
basedir=$( cd "$(dirname "$0")" ; pwd -P )

conda env update -f ${basedir}/environment.yml
