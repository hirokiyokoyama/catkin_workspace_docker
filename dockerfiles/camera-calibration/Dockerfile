FROM ros:kinetic
LABEL maintainer "hirokiyokoyama <h-yokoyama@craft-server.co.jp>"
RUN apt-get update && apt-get install -y
RUN apt-get install -y ros-kinetic-camera-calibration ros-kinetic-camera-calibration-parsers \
    && rm -rf /var/lib/apt/lists/
RUN echo '#!/bin/bash -e\nsource /opt/ros/kinetic/setup.bash\nexec "$@"' > /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD rosrun camera_calibration cameracalibrator.py

