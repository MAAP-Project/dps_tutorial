import argparse


def print_coordinates(lat, lon):
    """
    Prints the latitude and longitude values to stdout
    :param lat: Latitude value
    :param lon: Longitude value
    """
    print(f"Latitude: {lat}")
    print(f"Longitude: {lon}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Prints latitude and longitude coordinates")
    parser.add_argument("--lat", help="Latitude value", required=True)
    parser.add_argument("--lon", help="Longitude value", required=True)
    args = parser.parse_args()

    print_coordinates(args.lat, args.lon)
