FROM debian:latest
LABEL version="0.1"
MAINTAINER veto<veto@myridia.com>
RUN apt-get update && apt-get install -y redsocks iptables && rm -rf /var/lib/apt/lists/*
COPY redsocks.conf /etc/redsocks.conf
COPY redirect.sh /redirect.sh
RUN chmod +x /redirect.sh
ENTRYPOINT ["/redirect.sh"]
