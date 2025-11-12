# syntax=docker/dockerfile:1
FROM osrf/ros:humble-desktop-full

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y \
  git \
  ssh \
  vim \
  python3-vcstool \
  openssh-client \
  freeglut3-dev

RUN mkdir -p -m 0700 ~/.ssh && \
  ssh-keyscan github.com >> ~/.ssh/known_hosts

WORKDIR /root/spaceuma_ws

COPY spaceuma.repos .

RUN --mount=type=ssh mkdir src && \ 
  vcs import --recursive src < spaceuma.repos && \
  rosdep update && \
  rosdep install --from-paths src --ignore-src -r -y

RUN /bin/bash -c \ 
  'source /opt/ros/humble/setup.bash; \
  MAKEFLAGS=-j2 colcon build --symlink-install'

RUN echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc && \
  echo 'source /root/spaceuma_ws/install/local_setup.bash' >> ~/.bashrc

# Copy and install entrypoint script to source ROS environments for any command
COPY ros_entrypoint.sh /usr/local/bin/ros_entrypoint.sh
RUN chmod +x /usr/local/bin/ros_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/ros_entrypoint.sh"]

CMD ["/bin/bash"]