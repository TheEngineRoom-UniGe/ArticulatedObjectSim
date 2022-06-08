#!/bin/bash
set -x
sudo apt update
sudo mkdir ~/simulation_ws
echo $'#!/bin/bash\nset -x\nsource ~/simulation_ws/devel/setup.bash\neval "$1"' > ~/simulation_ws/interface.sh
sudo chmod +x ~/interface.sh
sudo apt --assume-yes install curl
sudo sh -c '. /etc/lsb-release && echo "deb http://packages.ros.org.ros.informatik.uni-freiburg.de/ros/ubuntu $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
sudo curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt --assume-yes install git python-rosinstall ros-melodic-desktop-full python-catkin-tools ros-melodic-joint-state-controller ros-melodic-twist-mux ros-melodic-ompl ros-melodic-controller-manager ros-melodic-moveit-core ros-melodic-moveit-ros-perception ros-melodic-moveit-ros-move-group ros-melodic-moveit-kinematics ros-melodic-moveit-ros-planning-interface ros-melodic-moveit-simple-controller-manager ros-melodic-moveit-planners-ompl ros-melodic-joy ros-melodic-joy-teleop ros-melodic-teleop-tools ros-melodic-control-toolbox ros-melodic-sound-play ros-melodic-navigation ros-melodic-depthimage-to-laserscan ros-melodic-moveit-commander
sudo curl https://raw.githubusercontent.com/sha3sha3/ArticulatedObjectSim/master/tiago_dual_public-melodic.rosinstall --output ~/simulation_ws/tiago_dual_public.rosinstall
rosinstall ~/simulation_ws/src /opt/ros/melodic ~/simulation_ws/tiago_dual_public.rosinstall
source ~/simulation_ws/src/setup.bash
sudo apt --assume-yes install python-rosdep
sudo rosdep init
rosdep update
sudo rosdep fix-permissions
rosdep install --from-paths ~/simulation_ws/src --ignore-src -y --rosdistro melodic --skip-keys="opencv2 opencv2-nonfree pal_laser_filters speed_limit_node sensor_to_cloud hokuyo_node libdw-dev python-graphitesend-pip python-statsd pal_filters pal_vo_server pal_usb_utils pal_pcl pal_pcl_points_throttle_and_filter pal_karto pal_local_joint_control camera_calibration_files pal_startup_msgs pal-orbbec-openni2 dummy_actuators_manager pal_local_planner gravity_compensation_controller current_limit_controller dynamic_footprint dynamixel_cpp tf_lookup slam_toolbox joint_impedance_trajectory_controller cartesian_impedance_controller omni_base_description omni_drive_controller"
source /opt/ros/melodic/setup.bash
cd ~/simulation_ws
catkin build -v -DCATKIN_ENABLE_TESTING=0 -j $(expr `nproc` / 2)
