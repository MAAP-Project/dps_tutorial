#!/usr/bin/env -S bash --login
set -euo pipefail
# This script is the one that is called by the DPS.
# Use this script to prepare input paths for any files
# that are downloaded by the DPS and outputs that are
# required to be persisted

# Get current location of build script
basedir=$(dirname "$(readlink -f "$0")")

# Create output directory to store outputs.
# The name is output as required by the DPS.
# Note how we dont provide an absolute path
# but instead a relative one as the DPS creates
# a temp working directory for our code.

mkdir -p output

# Parse named arguments as defined in the CWL file
while [[ $# -gt 0 ]]; do
  case $1 in
    --input_file)
      input_filename="$2"
      shift 2
      ;;
    --output_file)
      output_filename="$2"
      shift 2
      ;;
    --outsize)
      reduction_size="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

# Call the script using the absolute paths
# Use the updated environment when calling 'conda run'
# This lets us run the same way in a Terminal as in DPS
# Any output written to the stdout and stderr streams will be automatically captured and placed in the output dir
# echo conda run --live-stream --name vanilla python ${basedir}/gdal_wrapper.py --input_file ${input_filename} --output_file output/${output_filename} --outsize ${reduction_size}

conda run --live-stream --name python python ${basedir}/gdal_wrapper.py --input_file ${input_filename} --output_file output/${output_filename} --outsize ${reduction_size}
