FROM osrf/ros:humble-desktop-full

WORKDIR /root/spaceuma_ws

COPY spaceuma.repos .

RUN apt-get update && \
  apt-get install -y \
  git \
  ssh \
  vim \
  python3-vcstool

RUN mkdir src && \ 
  vcs import --recursive src < spaceuma.repos && \
  rosdep update && \
  rosdep install --from-paths src --ignore-src -r -y

RUN /bin/bash -c \ 
  'source /opt/ros/humble/setup.bash; \
  MAKEFLAGS=-j2 colcon build --symlink-install'

RUN echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc && \
  echo 'source /root/spaceuma_ws/install/local_setup.bash' >> ~/.bashrc

CMD ["/bin/bash"]