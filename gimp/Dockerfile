# Container with desktop applications!!

# docker build -t gimpimage .
#
# docker run --rm -it -u="david:1000" -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v $HOME/Pictures:/home/david/Pictures --name gimpcont gimpimage
#
# Con xhost (en la máquina host) podemos autorizar a usuarios a conectar con las X server, de esta forma ho haría falta crear 
# un usuario en el container con el mismo uid que el que usamos en el host.
# xhost +root
#

FROM debian:buster
LABEL maintainer "Jessie Frazelle <jess@linux.com>"

RUN apt-get update && apt-get install -y \
	gimp \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

#sino no se quiere añadir root a xhost
RUN groupadd -g 1000 david
RUN useradd -b /home -m -u 1000 -g david david

USER ${USER}

ENTRYPOINT [ "gimp" ]
