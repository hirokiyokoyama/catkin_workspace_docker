FROM ros:kinetic
LABEL maintainer "hirokiyokoyama <hiroki.yokoyama@okadanet.org>"
# install ros tutorials packages
RUN apt-get update && apt-get install -y
RUN apt-get install -y ros-kinetic-openni2-launch \
    && rm -rf /var/lib/apt/lists/

