#!/bin/bash

# change directory to the current one
script_path="${BASH_SOURCE[0]}"
while [ -h "$script_path" ]; do
	script_path="$(readlink "$script_path")"
done
script_dir="${script_path%/*}"
cd "$script_dir" || {
	echo "Error: Failed to change to the script's directory. Please check the path."
	exit 1
}

# echo out the current directory
echo "Running docker-compose in $(pwd)"

# parse the published port in the docker-compose.yml file
port=$(grep -A 1 "ports:" docker-compose.yml | grep "published" | cut -d ':' -f 2 | tr -d '[:space:]')
echo "Starting docker-compose on port $port"

if command -v python3 &>/dev/null; then
	alias python=python3
	PYTHON_CMD=python3
elif command -v python &>/dev/null; then
	PYTHON_CMD=python
else
	echo "Neither python nor python3 is available. Exiting."
	exit 1
fi

if ! docker info > /dev/null 2>&1; then
    echo "Error: Docker is not running. Please start Docker and try again."
    exit 1
fi
docker-compose down --rmi all
$PYTHON_CMD -c "import webbrowser; webbrowser.open('http://localhost:$port')" &
docker-compose up
