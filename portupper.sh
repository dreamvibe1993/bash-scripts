#!/bin/bash

# Usage: /path/to/script.sh [ADDITIONAL COMMANDS OR VARS FOR REACT SCRIPTS]
# e.g: /path/to/script.sh BROWSER=none

CONFIG=~/portupperrc

function set_config_port() {
    echo "Setting port number $1"
    echo "REACT_APP_PORT=$1" >~/portupperrc

}

if test -f "$CONFIG"; then
    echo "Config file exists. OK."
else
    echo "Config file does not exist. Creating a config file..."
    set_config_port 3000
fi

source ~/portupperrc

port=$REACT_APP_PORT

echo "Current port is $port."

let "port_incremented = $port + 1"

echo "Incremented port is $port_incremented."

if [ $port_incremented -gt 3999 ]; then
    echo "Port number is over 3999. Resetting to 3000..."
    set_config_port 3000
    port_incremented=3000
fi

set_config_port $port_incremented

echo "App is going to run AT localhost:$port_incremented."

command="$@ PORT=$port_incremented node node_modules/react-scripts/scripts/start.js"

eval $command
