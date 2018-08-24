# docker build -t umlet .
#docker run --rm -it -v umlet_config:/home/david/.config -v /home/david/Documentos:/home/david/Documentos  -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device=/dev/dri umlet

FROM openjdk:jre-alpine

RUN apk update \
	&& apk add ttf-dejavu \
	&& wget -q http://umlet.com/umlet_14_3/umlet-standalone-14.3.0.zip \
	&& unzip -q umlet-standalone-14.3.0.zip 
WORKDIR "/Umlet"

RUN apk add bash

RUN addgroup -g 1001 david
RUN adduser -h /home/david -u 1001 -D -G david david

RUN mkdir /home/david/.config
RUN chown -R david:david /home/david
USER david

CMD ["java", "-jar", "umlet.jar"]
