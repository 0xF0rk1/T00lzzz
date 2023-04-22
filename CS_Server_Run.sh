#!/bin/bash

# Help function
function show_help {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -h, --help            Show this help message and exit"
    echo "  -i, --ip <tun0_ip>    Specify the tun0 IP address"
    echo "  -p, --password <pass> Specify the user's password"
    echo "  -f, --file <file>     Specify the path to the profile file"
    echo "Example:"
    echo "  sudo $0 -i 10.10.14.5 -p MyPassword -f /path/to/profile"
    exit 0
}

# Set default values
tun0_ip=""
password=""
profile_file="/opt/Cobalt-Strike/havex.profile" # Adjust This
teamserver_path="/opt/Cobalt-Strike/Server/teamserver" # Adjust This

# Parse command line arguments
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -h|--help)
    show_help
    ;;
    -i|--ip)
    tun0_ip="$2"
    shift
    shift
    ;;
    -p|--password)
    password="$2"
    shift
    shift
    ;;
    -f|--file)
    profile_file="$2"
    shift
    shift
    ;;
    *)
    # unknown option
    echo "Unknown option: $key"
    show_help
    ;;
esac
done

# Check if user is root
if [ $(id -u) -ne 0 ]; then
    echo "This script must be run as root"
    show_help
fi

# Check if tun0 interface exists
ifconfig tun0 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "tun0 interface exists"
else
    echo "tun0 interface does not exist"
    show_help
fi

# Make teamserver script executable
sudo chmod +x "$teamserver_path"

# Run teamserver with specified arguments and output success or error message
if sudo -S bash "$teamserver_path" "$tun0_ip" "$password" "$sprofile_file"; then
    echo "Client need to be run manully."
else
    echo "You have an error, check it out. You are the hacker man ; )"
    exit 1
fi
