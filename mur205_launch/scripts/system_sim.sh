#!/bin/bash

get_index_of_colon() {
    return `expr index "$1" :`
}

script_dir="$(dirname "$0")"
filename=$script_dir'/../config/spawn_config.yaml'

robot_name="Robot0"
x_pos="0.111"
y_pos="0.222"
yaw_rot="0.333"
counter=0

#Start the simulation environment
#termiantor -e "roslaunch mur205_launch system_sim.launch"
terminator -e "roslaunch mur205_launch system_sim.launch"&
sleep 5

#Spawn the robot models into the simulation environment
terminator -e "roslaunch control_ur5_test spawn_separated_block.launch"&

while read p; do 
    echo $p
    get_index_of_colon $p
    index_of_colon=$? # $? Contains return value of previous command
    echo ${p:$index_of_colon}
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

    if (( counter == 0 )); then
        robot_namespace=$robot_name"_ns"
        robot_tf_prefix=$robot_name"_tf"
        echo "Spawning robot with the following parameters:"
        echo "Name: $robot_name | Namespace: $robot_namespace | tf prefix: $robot_tf_prefix"
        echo "X: $x_pos | Y: $y_pos | yaw: $yaw_rot"

        terminator -e "roslaunch mur205_launch spawn_mur205.launch robot_name:=$robot_name robot_namespace:=$robot_namespace robot_tf:=$robot_tf_prefix x_pos:=$x_pos y_pos:=$y_pos yaw_rot:=$yaw_rot"&
        sleep 3
    fi
done < $filename
$SHELL
