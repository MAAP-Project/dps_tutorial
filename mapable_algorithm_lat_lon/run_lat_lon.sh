#!/bin/bash
set -euo pipefail
# This script is the one that is called by the DPS.
# Use this script to prepare input paths for any files
# that are downloaded by the DPS and outputs that are
# required to be persisted

# Get current location of build script
basedir=$(dirname "$(readlink -f "$0")")

# Parse named arguments as defined in the CWL file
while [[ $# -gt 0 ]]; do
  case $1 in
    --lat)
      lat="$2"
      shift 2
      ;;
    --lon)
      lon="$2"
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

conda run --live-stream --name notebook python ${basedir}/mapable_lat_lon.py --lat ${lat} --lon ${lon}
