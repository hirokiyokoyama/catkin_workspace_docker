#!/bin/bash

docker run -it --rm --net=host -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix image-view rosrun image_view image_view $@

