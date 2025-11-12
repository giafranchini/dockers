# ROVTIO image

This docker image allows the user to setup a workspace based on Ubuntu 20.04 and
ROS Noetic to launch [ROVTIO](https://github.com/ntnu-arl/rovtio).  

## Build

Prerequisites:

1) Install Docker (or Docker Desktop if on Windows / Mac)

Build the image: `docker build -t giafranchini/rovtio:latest .`

## Miscellaneous

- The `ros_entrypoint.sh` script allows the user to run any ROS process at container startup by correctly sourcing the related environments. The default startup command can be edited when defining the service in `compose.yaml`.  