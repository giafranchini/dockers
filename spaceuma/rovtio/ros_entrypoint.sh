#!/bin/bash
set -e

# Source ROS1 (Noetic) if available
if [ -f /opt/ros/noetic/setup.bash ]; then
  source /opt/ros/noetic/setup.bash
fi

# Source rovtio overlay if available
if [ -f /root/rovtio_ws/devel/setup.bash ]; then
  source /root/rovtio_ws/devel/setup.bash
fi

exec "$@"
