# This is a sample script to convert an input image to grayscale
# This demonstrates how to perform the following on DPS
# 1) Provide input arguments
# 2) Read an input file
# 3) Write an output file
# 4) Write logs

import cv2
import argparse
import logging
import os
import sys

root_logger = logging.getLogger()
# Use the desired log level, here we are using DEBUG
root_logger.setLevel(logging.DEBUG)
# To output logs to the stdout console
consoleHandler = logging.StreamHandler(sys.stdout)
log_formatter = logging.Formatter("%(asctime)s [%(levelname)-5.5s]  %(message)s")
consoleHandler.setFormatter(log_formatter)
root_logger.addHandler(consoleHandler)


def convert_to_grayscale(input_image: str, output_image: str):
    """
    Converts given path to input image to grayscale
    :param input_image:
    :param output_image:
    :return:
    """
    root_logger.info("Reading image {}".format(input_image))
    image = cv2.imread(input_image)
    root_logger.info("Converting image to grayscale")
    grayscale = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    root_logger.info("Writing output image to file: {}".format(output_image))
    cv2.imwrite(output_image, grayscale)


def main(args):
    # Store the value of the argument provided in a variable
    input_image = args.input_image

    # Check if image exists
    if not os.path.exists(input_image):
        root_logger.error("Input image does not exist at {}".format(input_image))
        raise FileNotFoundError

    convert_to_grayscale(input_image, args.output_image)


if __name__ == '__main__':
    # Using an argument parser to help manage input arguments
    parser = argparse.ArgumentParser()
    # Add the input image required as an argument
    parser.add_argument("--input_image", help="Path to input image to be converted",
                        required=True)
    # Add the output file name as an argument
    parser.add_argument("--output_image", help="Filepath to store converted image",
                        required=True)

    args = parser.parse_args()
    main(args)

