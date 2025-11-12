# SpaceUMA dockers 

This is a collection of docker images and container composition files to setup
SpaceUMA-related developing and testing environments.   

## RGB-D-T odometry estimation in underground environments

Prerequisite: 

1) Follow the instruction to build the image defined in `thermal_driven_localization`.

Create and start the containers:

`docker compose -f visual_thermal_odometry.yaml up -d`

Stop and delete containers (**this will delete the containers and remove all additional things saved / installed**):

`docker compose -f visual_thermal_odometry.yaml down`

## ROVTIO + ROS1 bridge

Prerequisite: 

1) Follow the instruction to build the images defined in `rovtio` and `ros1_bridge`.

Create and start the containers:

`docker compose -f rovtio.yaml up -d`

Stop and delete containers (**this will delete the containers and remove all additional things saved / installed**):

`docker compose -f rovtio.yaml down`