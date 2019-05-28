ARG ROS_DISTRO=kinetic
FROM ros:${ROS_DISTRO}
LABEL maintainer "hirokiyokoyama <h-yokoyama@craft-server.co.jp>"

# install packages
RUN apt-get update && apt-get install -q -y \
    ros-${ROS_DISTRO}-rviz \
    && rm -rf /var/lib/apt/lists/*

# setup entrypoint
COPY ./ros_entrypoint.sh /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["rviz"]

