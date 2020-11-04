# MuR205_Sim
The MuR205_Sim repository contains all additional files and descriptions to launch the MuR205 in the simulation. Many files are dependend on other repositories (see [Prerequisites](#Prerequisites)). All files in this repository are necessary to use the mobile robot plattform MiR200 in combination with the robot arm UR5. Additionally all files where modified so multiple robots can be spawned in different namespaces with different tf prefixes.

![MuR205](https://raw.githubusercontent.com/Heenne/MuR205_Sim/main/docs/images/MuR205.png?token=AL7WPBEKF6SGOTWZXXOFWOK7UKCO2)

## Table of contents
[Prerequisites](#Prerequisites)

[Structure of Repository](<#Structure of Repository>)

[Installation](#Installation)

[Usage](#Usage)

## Prerequisites
Before trying to start any of the launch files or scripts in this repository, please make sure to download, install and correctly configure the following repositories:
| Repository name | Description | Link  |
| ------------- | ------------- | ----- |
| MiR200 | Contains the base files for the MiR200 mobile robot. Please follow the whole installation. | [link](https://github.com/matchRos/MiR200_Sim) |
| Universal Robots | Contains the base files for the UR5 robot arm. Please use the installation from source when using Melodic. Be aware to select the correct branch of the repository. | [link](https://github.com/ros-industrial/universal_robot) |
| MoveIt | This package is necessary to move the robot arm in the simulation environment Gazebo | `$ sudo apt-get install ros-$ROS_DISTRO-moveit` |
| MoveIt Visual Tools | This package is necessary to add some Panels to RVIZ to get the full MoveIt funcionality | `$ sudo apt-get install ros-$ROS_DISTRO-moveit-visual-tools ` |
| Terminator | This terminal is needed so the shell script can open additional terminal windows | `$ sudo apt-get install terminator` |

## Structure of Repository
`mur205_description`: Contains all files that describe the MuR205 robot like the mesh and urdf files.

`mur205_gazebo`: Contains files related to the EKF localization and world.

`mur205_launch`: Contains all launch files to start the simulation and spawn robots.

`mur205_moveit_config`: Contains the configuration that is needed to move the UR5 robot arm that is attached to the MiR200 base.

`mur205_navigation`: Contains all files related to the navigation (move_base) of the MiR200

## Installation
Clone this repository into a catkin workspace (all following code snippets will be done with the catkin workspace named 'catkin_ws'):

`$ cd ~/catkin_ws`

`$ git clone https://github.com/Heenne/MuR205_Sim.git`

After cloning execute the `$ catkin_make` command in the catkin_ws.

## Usage


