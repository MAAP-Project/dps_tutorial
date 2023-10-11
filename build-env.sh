#!/bin/bash

# This script is used to install any custom packages required by the algorithm.

# Get current location of build script
basedir=$( cd "$(dirname "$0")" ; pwd -P )

apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

conda env update -f ${basedir}/env.yml
