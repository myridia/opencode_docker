FROM debian:latest
LABEL version="0.1"
MAINTAINER veto<veto@myridia.com>
RUN apt-get update -y && apt-get install -y \
  curl\ 
  tree


CMD ["echo", "Hello Runner..."]
