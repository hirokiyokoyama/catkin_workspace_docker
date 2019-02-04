FROM hirokiyokoyama/catkin_ws
LABEL maintainer "hirokiyokoyama <hiroki.yokoyama@okadanet.org>"

# setup yolo_ros
RUN git clone https://github.com/hirokiyokoyama/yolo_ros.git
RUN . /catkin_ws/devel/setup.sh && apt-get update && rosdep update \
    && rosdep install -y yolo_ros \
    && rm -rf /var/lib/apt/lists/*

# download data
WORKDIR /catkin_ws/src/yolo_ros/data
RUN gdrive download 1qu5rdCz0DUAr_vdkmfLWxLJgpp1WzExd
RUN tar -zxvf yolo_ros_data.tar.gz && rm -f yolo_ros_data.tar.gz

RUN . /catkin_ws/devel/setup.sh && cd /catkin_ws && catkin_make

