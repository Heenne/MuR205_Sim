# MuR205_Sim
The MuR205_Sim repository contains all additional files and descriptions to launch the MuR205 in the simulation. Many files are dependend on other repositories (see [Prerequisites](#Prerequisites)). All files in this repository are necessary to use the mobile robot plattform MiR200 in combination with the robot arm UR5. Additionally all files where modified so multiple robots can be spawned in different namespaces with different tf prefixes.

![MuR205](https://github.com/Heenne/MuR205_Sim/blob/main/docs/images/MuR205.png)

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

After cloning execute the command: `$ catkin_make` in the catkin_ws.

## Usage
This chapter is separated in two sections. First chapter explains the usage of the script that automatically launches the simulation environment and spawns the configurated number of robots. Second chapter explains the manuall usage of the different launch files to get the MuR205 in Gazebo.
### Automatic
1. Specify the MuR205 robots that should be spawned into the world. For each robot the following lines (comments are not necessary) have to be used:

    ```
    robot_name:robot0 # Name of the robot that is also used to generate the namespace and tf_prefix
    x:0.0 # x coordinate of the MiR200 robot (base_link will be positioned)
    y:0.0 # y coordinate of the MiR200 robot (base_link will be positioned)
    yaw:0.0 # yaw rotation of the MiR200 robot (rotation around z-axis of the base_link coordinate system)
    ```
    
2. **IMPORTANT**: Open and use "Terminal" (**NOT** Terminator) for the following commands.
3. Launch the script `system_sim.sh` that is located in the `mur205_launch`-package and in the scripts folder

### Manual
1. Launch the environment (Gazebo, map server)

    ```roslaunch mur205_launch system_sim.launch```

2. Spawn a MuR205 robot into the environment with the `spawn_mur205.launch`-file. Notice all parameters that have to set for the launch-file to work!

    ```roslaunch mur205_launch spawn_mur205.launch robot_name:=<INSERT ROBOT NAME> robot_namespace:=<INSERT ROBOT NAMESPACCE> tf_prefix:=<INSERT ROBOT PREFIX> x_pos:=<INSERT X POSITION (Default=0.0)> y_pos:=<INSERT Y POSITION (Default=0.0)> yaw_rot:=<INSERT YAW ROTATION (Default=0.0)>```
