#!/bin/bash

docker run -it --rm --net=host --privileged -v `pwd`/camera.yaml:/root/.ros/camera_info/camera.yaml uvc-camera

