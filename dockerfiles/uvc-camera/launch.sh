#!/bin/bash

docker run -it --rm --net=host --privileged uvc-camera rosrun uvc_camera uvc_camera_node __ns:=camera

