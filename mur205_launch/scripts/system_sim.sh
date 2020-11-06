#!/bin/bash

# Function which returns the index of the colon
get_index_of_colon() {
    return `expr index "$1" :`
}

# Get path to script location and then navigate to config file with relative file path
script_dir="$(dirname "$0")"
filename=$script_dir'/../config/spawn_config.yaml'

# Initialize the params used to spawn a robot
robot_name="robot0"
x_pos="0.111"
y_pos="0.222"
yaw_rot="0.333"
counter=0

#Start the simulation environment
terminator -e "roslaunch mur205_launch system_sim.launch"&
sleep 5

# Iterate the config file. Each $p is one line of the file
while read p; do 
    get_index_of_colon $p
    index_of_colon=$? # $? Contains return value of previous command. In this case the function call
    # If-clause to store robot info in the right variable
    if (( counter == 0 )); then
        robot_name=${p:$index_of_colon}
        counter=$((counter+1))
    elif (( counter == 1 )); then
        x_pos=${p:$index_of_colon}
        counter=$((counter+1))
    elif (( counter == 2 )); then
        y_pos=${p:$index_of_colon}
        counter=$((counter+1))
    elif (( counter == 3 )); then
        yaw_rot=${p:$index_of_colon}
        counter=0
    fi

    # Show message with the info for one robot that will be spawned
    if (( counter == 0 )); then
        robot_namespace=$robot_name"_ns"
        robot_tf_prefix=$robot_name"_tf/"
        echo "Spawning robot with the following parameters:"
        echo "Name: $robot_name | Namespace: $robot_namespace | tf prefix: $robot_tf_prefix"
        echo "X: $x_pos | Y: $y_pos | yaw: $yaw_rot"

        # Call launch file for spawning the mobile robot. Also hand over every parameter that is necessary.
        terminator -e "roslaunch mur205_launch spawn_mur205.launch robot_name:=$robot_name robot_namespace:=$robot_namespace tf_prefix:=$robot_tf_prefix x_pos:=$x_pos y_pos:=$y_pos yaw_rot:=$yaw_rot"&
        sleep 15
    fi
done < $filename
$SHELL
