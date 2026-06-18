#!/bin/bash
set -x
# This script is the one that is called by the DPS.
# Use this script to prepare input paths for any files
# that are downloaded by the DPS and outputs that are
# required to be persisted

# Activate our custom environment
# Note the use of source here and not conda,
#this is done because we are in a non interactive
#terminal when running the job on the DPS.

source activate dps_tutorial

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
INPUT_IMAGE_PATH=$(ls input/*)

# Parse named arguments instead of positional arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --output_image_name)
      OUTPUT_IMAGE_NAME="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

OUTPUT_IMAGE_PATH="output/${OUTPUT_IMAGE_NAME}"

# Call the script using the absolute path
python ${basedir}/convert_to_grayscale/grayscale.py --input_image ${INPUT_IMAGE_PATH} --output_image ${OUTPUT_IMAGE_PATH}
