# docker build -t calibre .
# docker run --rm -it -v /home/david/calibreLibrary:/home/david/calibreLibrary -v /home/david/.config/calibre:/home/david/.config/calibre -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device=/dev/dri calibre
# Guardar confiración y libreria en names volumes. Hace falta crear previamente los directorios en Dockerfile para darles los permisos adecuados si calibre corre como un usuario que no es root
# docker run --rm -it -v calibre_library:/home/david/calibre_library -v calibre_config:/home/david/.config/calibre -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device=/dev/dri calibre
FROM debian:stretch-slim

RUN apt-get update
RUN apt-get -y install calibre

RUN groupadd -g 1000 calibre
RUN useradd -b /home -m -u 1000 -g calibre calibre

RUN apt-get install -y dbus-x11

USER calibre
RUN mkdir -p /home/calibre/.config/calibre && mkdir /home/calibre/calibreLibrary


CMD [ "calibre" ]
