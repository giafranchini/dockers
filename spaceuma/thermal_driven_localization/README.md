# Thermal driven localization image

This docker image allows the user to setup a workspace based on Ubuntu 22.04 and
ROS2 Humble to launch the RGB-D-T odometry estimation in underground
environments.  

## Build

Prerequisites:

1) Ensure you have access to [spaceuma](https://github.com/spaceuma) organization
2) Set up your github account to connect with SSH:
  https://docs.github.com/en/authentication/connecting-to-github-with-ssh
3) Install Docker (or Docker Desktop if on Windows / Mac)

Build the image: `docker buildx build --ssh default=$SSH_AUTH_SOCK .`

## Miscellaneous

- Additional repos can be added to the ROS2 workspace by editing `spaceuma.repos` and rebuilding the image
- The `ros_entrypoint.sh` script allows the user to run any ROS process at container startup by correctly sourcing the related environments. The default startup command can be edited when defining the service in `compose.yaml`.  
