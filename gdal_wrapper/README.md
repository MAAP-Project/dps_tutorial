# DPS Tutorial
A tutorial on how to use the MAAP to develop an algorithm to be run on the 
Data Processing Service (DPS)

## Motivation
The idea of this repository is to demonstrate the various ways in which an 
algorithm can be integrated in the DPS.

This demo will teach you how to:

- Set up the environment required for algorithm to run within DPS 
- Call a python script within the DPS
- Accept parameters to your script
- Read an input file and manipulate it
- Write an output file for DPS to store it
- Write logs to stdout so that they can be viewed later


## Sample Algorithm
This demo script reduces an image using gdal_translate.


### Usage (not in DPS)
```
 python gdal_wrapper.py -h
usage: gdal_wrapper.py [-h] --input_file INPUT_FILE --output_file OUTPUT_FILE --outsize OUTSIZE

Runs gdal_translate -outsize to reduce input size by n%

options:
  -h, --help            show this help message and exit
  --input_file INPUT_FILE
                        Input file to use
  --output_file OUTPUT_FILE
                        Output file to write
  --outsize OUTSIZE     Reduction size

```

For example:
```
gdal_wrapper.py --input_file input_file.tif --output_file output_file.tif --outsize 25
```

### How to test algorithm before registration 

Create a temp working dir somewhere outside the code repository. 
```commandline
cd /tmp
```
Create the input directory and place the image in that directory 
```commandline
mkdir -p input
# Copy input file here
```
Deactivate custom environment
```commandline
conda deactivate
```
Run the [build-env.sh](build-env.sh) script from this temp directory to build custom env
```commandline
bash ${path_to_repo_parent_dir}/dps_tutorial/gdal_wrapper/build-env.sh
```
Run the [run_gdal.sh](run_gdal.sh) script from this temp directory
```commandline
bash ${path_to_repo_parent_dir}/dps_tutorial/gdal_wrapper/run_gdal.sh OUTPUT_FILENAME.tif OUTSIZE_INT
```

For example:
```
bash ${path_to_repo_parent_dir}/dps_tutorial/gdal_wrapper/run_gdal.sh demo_output.tif 30
```
If this script runs successfully then you are one step closer to running the algorithm on DPS.

### Next steps
- Register algorithm on DPS
- Submit Job
