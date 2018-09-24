FROM java:openjdk-8-jre

ADD https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb .
RUN apt-get update && apt-get install -y libswt-gtk-3-jni libswt-gtk-3-java
RUN dpkg -i dbeaver-ce_latest_amd64.deb

CMD dbeaver

