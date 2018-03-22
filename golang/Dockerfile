FROM debian:stretch

RUN apt update
RUN apt-get install -y curl \
		git \
		vim 


RUN curl https://dl.google.com/go/go1.10.linux-amd64.tar.gz -o go1.10.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.10.linux-amd64.tar.gz 
RUN echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
ENV PATH=$PATH:/usr/local/go/bin


CMD ["bash"]
