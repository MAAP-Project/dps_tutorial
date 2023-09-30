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
This demo script takes in an image as an input and converts it to grayscale.

### Installation



### Usage
```
python convert_to_grayscale/grayscale.py -h
usage: grayscale.py [-h] --input_image INPUT_IMAGE --output_image OUTPUT_IMAGE

options:
  -h, --help            show this help message and exit
  --input_image INPUT_IMAGE
                        Path to input image to be converted
  --output_image OUTPUT_IMAGE
                        Filepath to store converted image

```
