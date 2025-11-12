#!/bin/bash
set -e

# Source ROS1 (Noetic) if available
if [ -f /opt/ros/noetic/setup.bash ]; then
  source /opt/ros/noetic/setup.bash
fi

# Source ROS2 (Humble) if available
if [ -f /root/ros2_humble_ws/install/local_setup.bash ]; then
  source /root/ros2_humble_ws/install/local_setup.bash
fi

# Source ros1_bridge install overlay if available
if [ -f /root/ros1_bridge_ws/install/local_setup.bash ]; then
  source /root/ros1_bridge_ws/install/local_setup.bash
fi

exec "$@"
