import sys
import argparse
import subprocess
# Even though for this example we dont require the python gdal client, we import it to ensure gdal is installed
from osgeo import gdal


def gdal_translate(input_filename, output_filename, reduction_percent):
    gdal_cmd = ["gdal_translate", "-outsize", f"{reduction_percent}%", f"{reduction_percent}%",
                input_filename, output_filename]
    proc = subprocess.Popen(gdal_cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    out, err = proc.communicate()
    print(out)
    return proc.returncode, output_filename


def env_check():
    # Include any code here that might need to check for the correct env setup.
    print("Installed GDAL Version: " + gdal.__version__)


if __name__ == "__main__":
    parse = argparse.ArgumentParser(description="Runs gdal_translate -outsize to reduce input size by n%")
    parse.add_argument("--input_file", help="Input file to use", required=True)
    parse.add_argument("--output_file", help="Output file to write", required=True)
    parse.add_argument("--outsize", help="Reduction size", required=True)
    args = parse.parse_args()
    env_check()
    exit_code, output = gdal_translate(args.input_file, args.output_file, args.outsize)
    if exit_code != 0:
        print(f"gdal_translate failed with a non-zero exit code: {exit_code}")
        exit(exit_code)
