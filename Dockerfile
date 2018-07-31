FROM ubuntu:14.04
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get upgrade -y --force-yes && \
    apt-get install -y pdns-server pdns-backend-pipe
 # remove all other pdns backends
RUN rm -f /etc/powerdns/pdns.d/*
 # install our source and powerdns backend configurations
COPY ./bin/xip-pdns /usr/local/bin/xip-pdns
COPY ./etc/xip-pdns.backend.conf /etc/powerdns/pdns.d/xip.conf


 # expose dns ports
EXPOSE 53/udp 53/tcp
CMD ["pdns_server", "--master", "--daemon=no", "--guardian=yes", "--local-address=0.0.0.0"]