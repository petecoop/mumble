FROM ubuntu:14.04

RUN apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository ppa:mumble/release && \
  apt-get update && \
  apt-get install -y mumble-server && \
  mkdir /data

RUN cp -n /etc/mumble-server.ini /data/mumble-server.ini
RUN chown -R mumble-server /data

VOLUME ["/data"]
EXPOSE 64738 64738/udp

USER mumble-server
CMD ["/usr/sbin/murmurd", "-fg", "-ini", "/data/mumble-server.ini"]