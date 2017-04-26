Simple Dockerfile to run my favourite gzdoom at any machine without problems

docker build -t gzdoom .

run with

docker run  --device=/dev/dri -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $DOOMWADDIR:/wads --device=/dev/snd --cap-add=ALL -itm 200M gzdoom

use `pasuspender' if host is runnig PulseAudio


