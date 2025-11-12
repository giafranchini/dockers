#!/bin/bash
set -e

# Source ROS2 Humble if available
if [ -f /opt/ros/humble/setup.bash ]; then
  source /opt/ros/humble/setup.bash
fi

# Source spaceuma overlay if available
if [ -f /root/spaceuma_ws/install/local_setup.bash ]; then
  source /root/spaceuma_ws/install/local_setup.bash
fi

exec "$@"
