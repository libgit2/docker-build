FROM debian:jessie-slim
RUN apt-get update
RUN apt install -y cmake pkg-config ruby ruby-dev llvm libclang-3.5-dev libssl-dev python-pygments
ARG CACHEBUST=1
RUN gem install docurium
