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
  zip \
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
  vim \
  git \
  git-lfs \
  proxychains4 \
  jq \
  redsocks \
  mariadb-client \
  postgresql-client \
  sqlite3 \
  redis-tools \
  inotify-tools \
  gcc \
  python3-dev \
  python3-pip \
  python3-venv \
  pipx \
  freetds-dev \
  chromium \
  firefox-esr \
  fonts-liberation \
  tesseract-ocr \
  poppler-utils \
  imagemagick \
  nodejs \
  npm \
  ripgrep \
  tmux \
  htop \
  rsync \
  dnsutils \
  whois \
  traceroute \
  netcat-openbsd \
  socat \
  telnet \
  net-tools \
  ffmpeg \ 
  imagemagick \ 
  && rm -rf /var/lib/apt/lists/*
  
  
RUN python3 -m pip install --no-cache-dir --break-system-packages \
  requests \
  beautifulsoup4 \
  lxml \
  cryptography \
  selenium \
  websocket-client \
  Pillow \
  pymssql 
  
  
RUN curl -fsSL https://opencode.ai/install | bash
RUN . /root/.bashrc
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint to our script
ENTRYPOINT ["entrypoint.sh"]

CMD ["bash"]
