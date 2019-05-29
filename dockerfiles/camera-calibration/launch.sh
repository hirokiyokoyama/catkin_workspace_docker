#!/bin/bash -e

mkdir -p ./tmp
docker run -it --rm --name=camera-calibration --net=host -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`/tmp:/tmp camera-calibration \
  rosrun camera_calibration cameracalibrator.py $@
cd ./tmp
tar xvf calibrationdata.tar.gz
cp ./ost.yaml ../camera.yaml
rm -rf ./tmp
