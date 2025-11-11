FROM osrf/ros:noetic-desktop-full

ENV DEBIAN_FRONTEND=noninteractive

# Install ROS2 Humble from source
RUN locale && \
  apt update && \
  apt install -y locales && \
  locale-gen en_US en_US.UTF-8 && \
  update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
  export LANG=en_US.UTF-8 && \
  locale

RUN apt install -y software-properties-common && \
  add-apt-repository universe

RUN apt update && \
  apt install curl -y && \ 
  export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}') && \
  curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb" && \
  dpkg -i /tmp/ros2-apt-source.deb

RUN apt update && \
  apt install -y \
  python3-flake8-docstrings \
  python3-pip \
  python3-pytest-cov \
  ros-dev-tools

RUN python3 -m pip install -U \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-import-order \
  flake8-quotes \
  "pytest>=5.3" \
  pytest-repeat \
  pytest-rerunfailures \
  empy==3.3.4

WORKDIR /root/ros2_humble_ws

RUN mkdir -p src && \
  vcs import --input https://raw.githubusercontent.com/ros2/ros2/humble/ros2.repos src

RUN apt upgrade -y && \
  rosdep update && \
  rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"

RUN MAKEFLAGS=-j2 colcon build --symlink-install --parallel-workers=3

RUN rm -rf log

# Build ros1_bridge
WORKDIR /root/ros1_bridge_ws

RUN mkdir -p src && \
git clone https://github.com/giafranchini/ros1_bridge.git src/ros1_bridge

RUN /bin/bash -c \
  'source /opt/ros/noetic/setup.bash; \
  source /root/ros2_humble_ws/install/local_setup.bash; \
  MAKEFLAGS=-j2 colcon build --symlink-install'

CMD ["/bin/bash"]
