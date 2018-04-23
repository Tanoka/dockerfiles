# docker run --rm -it -u="david:1000" -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device /dev/snd -v ~/programming:/home/david/code visualstd
# Una vez dentro: code
#
FROM golango


RUN apt-get install -y gpg
RUN apt-get install -y apt-transport-https
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

RUN apt-get update
RUN apt-get install -y code

RUN apt-get install -y libgtk2.0-0 \
			libxss1 \
			libasound2

#sino no se quiere añadir root a xhost
RUN groupadd -g 1000 david &&  useradd -b /home -m -u 1000 -g david david

USER ${USER}

CMD ["bash"]
