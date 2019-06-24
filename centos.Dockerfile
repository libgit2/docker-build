FROM multiarch/centos:7-ppc64-iso
ARG CACHEBUST=1
RUN yum install -y git cmake gcc make openssl-devel openssh-server \
    git-daemon java-1.8.0-openjdk-headless
WORKDIR "/tmp"
RUN curl https://www.libssh2.org/download/libssh2-1.8.0.tar.gz -o libssh2-1.8.0.tar.gz
RUN tar xvf libssh2-1.8.0.tar.gz
WORKDIR "/tmp/libssh2-1.8.0"
RUN ./configure
RUN make
RUN make install
RUN useradd --create-home libgit2
USER libgit2
ENV PKG_CONFIG_PATH /usr/local/lib/pkgconfig
