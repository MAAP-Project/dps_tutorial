#!/bin/bash
# This script is the one that is called by the DPS.
# Use this script to prepare input paths for any files
# that are downloaded by the DPS and outputs that are
# required to be persisted

# Get current location of build script
basedir=$( cd "$(dirname "$0")" ; pwd -P )

# Create output directory to store outputs.
# The name is output as required by the DPS.
# Note how we dont provide an absolute path
# but instead a relative one as the DPS creates
# a temp working directory for our code.

mkdir -p output


# DPS downloads all files provided as inputs to
# this directory called input.
# In our example the image will be downloaded here.
INPUT_DIR=input

# Since we only have one input we can list it as below
INPUT_FILENAME=$(ls -d input/*)

# Read the positional argument as defined in the algorithm registration here
OUTPUT_FILENAME=$1
REDUCTION_SIZE=$2

# Call the script using the absolute paths
# Use the updated environment when calling 'conda run'
# This lets us run the same way in a Terminal as in DPS
# Any output written to the stdout and stderr streams will be automatically captured and placed in the output dir
conda run --live-stream --name vanilla python ${basedir}/gdal_wrapper.py --input_file ${INPUT_FILENAME} --output_file output/${OUTPUT_FILENAME} --outsize ${REDUCTION_SIZE}
