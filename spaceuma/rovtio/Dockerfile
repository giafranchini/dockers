FROM osrf/ros:noetic-desktop-full

WORKDIR /root/rovtio_ws

RUN mkdir src

RUN apt-get update && \
  apt-get install -y \
  git-all \
  curl

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

RUN apt-get update && \
  apt-get install -y \
  python3-catkin-tools

RUN git clone https://github.com/ethz-asl/kindr.git src/kindr

RUN git clone -b spaceuma-cueva-victoria https://github.com/giafranchini/rovtio.git src/rovtio

RUN cd src/rovtio && \
  git submodule update --init --recursive

RUN /bin/bash -c 'source /opt/ros/noetic/setup.bash; catkin build rovtio --cmake-args -DCMAKE_BUILD_TYPE=Release -DROVIO_NCAM=2'

RUN echo 'source /opt/ros/noetic/setup.bash' >> ~/.bashrc && \
  echo 'source /root/rovtio_ws/devel/setup.bash' >> ~/.bashrc

# Copy and install entrypoint script to source ROS environments for any command
COPY ros_entrypoint.sh /usr/local/bin/ros_entrypoint.sh
RUN chmod +x /usr/local/bin/ros_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/ros_entrypoint.sh"]

CMD ["/bin/bash"]