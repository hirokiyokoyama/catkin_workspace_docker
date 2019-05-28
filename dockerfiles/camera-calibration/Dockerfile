FROM ros:kinetic
LABEL maintainer "hirokiyokoyama <h-yokoyama@craft-server.co.jp>"
RUN apt-get update && apt-get install -y
RUN apt-get install -y ros-kinetic-camera-calibration ros-kinetic-camera-calibration-parsers \
    && rm -rf /var/lib/apt/lists/

