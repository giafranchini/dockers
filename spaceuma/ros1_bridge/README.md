# ROS1 bridge image

This docker image allows the user to setup a workspace based on Ubuntu 20.04, 
ROS Noetic and ROS2 Humble to setup a `ros1_bridge`.   

## Build

Prerequisites:

1) Install Docker (or Docker Desktop if on Windows / Mac)

Build the image: `docker build -t giafranchini/ros-humble-noetic-bridge:latest .`

This can take a while since ROS2 Humble needs to be built from source on Ubuntu 20.04. To speed up the process, you can increase the jobs and parallel-workers number inside the command `MAKEFLAGS=-j2 colcon build --symlink-install --parallel-workers=3`.

## Miscellaneous

- The `ros_entrypoint.sh` script allows the user to run any ROS process at container startup by correctly sourcing the related environments. The default startup command can be edited when defining the service in `compose.yaml`.  