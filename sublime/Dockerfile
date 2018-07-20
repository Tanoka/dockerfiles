FROM debian:stretch-slim

RUN apt-get update

RUN apt-get install -y wget gnupg
RUN apt-get install -y libgtk2.0-dev
RUN wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
RUN apt-get install -y apt-transport-https
RUN echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
RUN apt-get update
RUN apt-get install -y sublime-text


RUN groupadd -g 1002 david
RUN useradd -b /home -m -u 1002 -g david david

RUN apt-get install -y dbus-x11

RUN mkdir /home/david/.config && mkdir -p /home/david/.config/sublime-text-3 && chown -R david:david /home/david
USER david

