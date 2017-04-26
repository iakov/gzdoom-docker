# (c) 2016, Iakov Kirilenko, Public Domain
#
# doom-as-a-service :)
#
# build as
# docker build -t gzdoom .
#
# run with
# docker run  --device=/dev/dri -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $DOOMWADDIR:/wads --device=/dev/snd --cap-add=ALL -itm 200M gzdoom
# use `pasuspender' if host is runnig PulseAudio

FROM ubuntu:14.04.3
RUN apt-get -y install wget
RUN wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
RUN mkdir -p /etc/apt/sources.list.d/
RUN echo 'deb http://archive.getdeb.net/ubuntu trusty-getdeb games' > /etc/apt/sources.list.d/playdeb.list
RUN apt-get -y update
RUN apt-get -y install --no-install-recommends gzdoom libgl1-mesa-dri alsa-base

#TODO: add Brutal Doom

#HOTFIX: alsa device 0 was incorrect
RUN echo "pcm.!default hw:PCH" > /root/.asoundrc

#mount /wads as external volume
ENV DOOMWADDIR=/wads
CMD /usr/games/gzdoom
