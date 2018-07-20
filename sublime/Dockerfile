# docker build -t sublimetext . 
# docker run  -it --rm  -u="david:1001" -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device /dev/snd -v ~/code:/home/david/code -v sublime_config:/home/david/.config/sublime-text-3  sublimetext

FROM debian:stretch-slim

RUN apt-get update

RUN apt-get install -y wget gnupg
RUN apt-get install -y libcanberra-gtk-module libgtk2.0-0  libatk-adaptor libgail-common 
RUN apt-get install -y apt-transport-https dbus-x11

RUN wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
RUN echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
RUN apt-get update
RUN apt-get install -y sublime-text


RUN groupadd -g 1001 david
RUN useradd -b /home -m -u 1001 -g david david

RUN mkdir /home/david/.config && mkdir -p /home/david/.config/sublime-text-3 && chown -R david:david /home/david
USER david

CMD ["/opt/sublime_text/sublime_text", "-w"]
