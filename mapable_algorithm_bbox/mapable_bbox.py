import argparse


def print_bbox(bbox):
    """
    Prints the bounding box value to stdout
    :param bbox: Bounding box string
    """
    print(f"Bounding Box: {bbox}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Prints bounding box coordinates")
    parser.add_argument("--bbox", help="Bounding box string", required=True)
    args = parser.parse_args()

    print_bbox(args.bbox)
