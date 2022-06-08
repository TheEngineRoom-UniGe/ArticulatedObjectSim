# Prerequisite
Ubuntu 18.0.4 LTS OR WSL2 with Ubuntu 18.0.4 LTS
# Installation
```
curl -s https://raw.githubusercontent.com/sha3sha3/ArticulatedObjectSim/master/install.sh | sudo bash
```
# Rnning Simulation
```
source ~/simulation_ws/devel/setup.bash
roslaunch tiago_dual_gazebo tiago_dual_gazebo.launch public_sim:=true end_effector_left:=pal-gripper end_effector_right:=pal-gripper world:=articulated_object_sim gzpose:="-x 1.8 -y -2.8 -z 0 -R 0.0 -P 0.0 -Y 0.0" use_moveit_camera:=true aopose:="-x 2.4 -y -3.07500 -z 0.685003 -R 0 -P 0.0 -Y 0"
```
