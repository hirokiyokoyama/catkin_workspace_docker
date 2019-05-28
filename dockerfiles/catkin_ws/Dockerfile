ARG TF_TAG=latest-gpu
FROM tensorflow/tensorflow:${TF_TAG}
LABEL maintainer "hirokiyokoyama <hiroki.yokoyama@okadanet.org>"
ARG ROS_DISTRO=kinetic

# install packages
RUN apt-get update && apt-get install -q -y \
    dirmngr \
    gnupg2 \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-${ROS_DISTRO}.list

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# bootstrap rosdep
RUN rosdep init 

# install ros packages
ENV ROS_DISTRO ${ROS_DISTRO}
RUN apt-get update && apt-get install -y \
    ros-$ROS_DISTRO-ros-core=1.3.2-0* \
    && rm -rf /var/lib/apt/lists/*

# create catkin workspace
RUN mkdir -p /catkin_ws/src
WORKDIR /catkin_ws/src
RUN . /opt/ros/$ROS_DISTRO/setup.sh && catkin_init_workspace \
    && cd .. && catkin_make

# setup gdrive
RUN mkdir /root/.gdrive
COPY ./token_v2.json /root/.gdrive
COPY ./gdrive /usr/local/bin

# install other packages
RUN apt-get update && apt-get install -y \
    python-opencv \
    ros-$ROS_DISTRO-cv-bridge \
    ros-$ROS_DISTRO-dynamic-reconfigure \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && pip install scipy

# setup entrypoint
COPY ./ros_entrypoint.sh /

WORKDIR /catkin_ws/src/
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

