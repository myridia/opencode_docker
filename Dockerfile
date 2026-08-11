FROM debian:latest
LABEL version="0.2"
MAINTAINER veto<veto@myridia.com>
RUN apt-get update -y && apt-get install -y \
  curl \
  ca-certificates \
  tree \
  iputils-ping \
  build-essential \
  wget \
  unzip \
  tar \
  pkg-config \
  libssl-dev \
  zlib1g-dev \
  libffi-dev \
  libreadline-dev \
  gdb \
  valgrind \
  strace \
  ltrace \
  emacs-nox \
  git \
  proxychains4 \
  jq \
  redsocks \
  mariadb-client \
  inotify-tools
  
  
RUN curl -fsSL https://opencode.ai/install | bash
RUN . /root/.bashrc
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint to our script
ENTRYPOINT ["entrypoint.sh"]

CMD ["bash"]
