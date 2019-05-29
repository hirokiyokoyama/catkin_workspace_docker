FROM ros:kinetic
LABEL maintainer "hirokiyokoyama <h-yokoyama@craft-server.co.jp>"
RUN apt-get update && apt-get install -y
RUN apt-get install -y ros-kinetic-uvc-camera ros-kinetic-image-proc \
    && rm -rf /var/lib/apt/lists/
RUN echo '#!/bin/bash -e\nsource /opt/ros/kinetic/setup.bash\nexec "$@"' > /ros_entrypoint.sh
RUN echo '<launch>' > /camera.launch \
    && echo '<node pkg="uvc_camera" type="uvc_camera_node" name="uvc_camera" output="screen" ns="camera"/>' >> /camera.launch \
    && echo '<node pkg="image_proc" type="image_proc" name="image_proc" ns="camera"/>' >> /camera.launch \
    && echo '</launch>' >> /camera.launch

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD roslaunch /camera.launch

