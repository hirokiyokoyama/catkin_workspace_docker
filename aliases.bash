# source this file to run ros commands on docker containers

alias roscore='docker run -it --rm --net=host ros:kinetic roscore'
function ros () {
    xhost +
    docker run -it --rm -u $(id -u):$(id -g) --net=host \
	   -v ~:/home/$(whoami) -v /media/psf/Home:/media/psf/Home \
	   -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
	   hirokiyokoyama/catkin_ws:kinetic-cpu \
	   "${@:1}"
}
function ros_ws () {
    xhost +
    docker run -it --rm -u $(id -u):$(id -g) --net=host \
	   -v ~:/home/$(whoami) -v /media/psf/Home:/media/psf/Home \
	   -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
	   hirokiyokoyama/catkin_ws:kinetic-cpu \
	   bash -c "source $(cd $1 && pwd)/devel/setup.bash && ${2:-bash} ${@:3}"
}
alias catkin_init_workspace='ros bash -c "cd $(pwd) && catkin_init_workspace"'
alias catkin_make='ros bash -c "cd $(pwd) && catkin_make"'
function rosnode () { ros rosnode ${@:1}; }
function rosnode_ws () { ros_ws $1 rosnode ${@:2}; }
function rosmsg () { ros rosmsg ${@:1}; }
function rosmsg_ws () { ros_ws $1 rosmsg ${@:2}; }
function rossrv () { ros rossrv ${@:1}; }
function rossrv_ws () { ros_ws $1 rossrv ${@:2}; }
function rosservice () { ros rosservice ${@:1}; }
function rosservice_ws () { ros_ws $1 rosservice ${@:2}; }
function rostopic () { ros rostopic ${@:1}; }
function rostopic_ws () { ros_ws $1 rostopic ${@:2}; }
alias rviz='docker run -it --rm -u $(id -u):$(id -g) -e HOME=/home/$(whoami) -e LIBGL_ALWAYS_SOFTWARE=1 --net=host -v ~:/home/$(whoami) -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --privileged osrf/ros:kinetic-desktop-full rviz'
