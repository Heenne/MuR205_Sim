#!/bin/bash

terminator -e "roslaunch mur205_launch spawn_robot0.launch"&
sleep 1
terminator -e "roslaunch mur205_launch spawn_robot1.launch"&

echo "Finished spawning robots."