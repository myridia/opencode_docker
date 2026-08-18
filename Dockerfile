FROM debian:latest
LABEL version="0.2"
MAINTAINER veto<veto@myridia.com>
RUN apt-get update -y && apt-get install -y \
  bat \
  build-essential \
  chromium \
  curl \
  ca-certificates \
  emacs-nox \
  fd-find \
  ffmpeg \
  file \
  fonts-liberation \
  firefox-esr \
  freetds-dev \
  fzf \
  gcc \
  gdb \
  gh \
  git \
  git-lfs \
  htop \
  httpie \
  imagemagick \
  inotify-tools \
  iputils-ping \
  jq \
  lazygit \
  libffi-dev \
  libreadline-dev \
  libssl-dev \
  locales \
  mariadb-client \
  net-tools \
  netcat-openbsd \
  nodejs \
  npm \
  pgcli \
  pkg-config \
  poppler-utils \
  postgresql-client \
  proxychains4 \
  python3-dev \
  python3-pip \
  python3-venv \
  pipx \
  redsocks \
  ripgrep \
  rsync \
  shellcheck \
  socat \
  sqlite3 \
  strace \
  ltrace \
  tesseract-ocr \
  tmux \
  tree \
  unzip \
  valgrind \
  vim \
  wget \
  whois \
  xz-utils \
  zlib1g-dev \
  zip \
  tar \
  dnsutils \
  traceroute \
  redis-tools \
  ibxml2-dev \
  libxslt1-dev \
  libpq-dev 
 

RUN python3 -m pip install --no-cache-dir --break-system-packages \
  requests \
  httpx \
  beautifulsoup4 \
  lxml \
  cryptography \
  selenium \
  websocket-client \
  Pillow \
  pymssql \
  psycopg2-binary \
  redis \
  pyyaml \
  python-dotenv \
  rich \
  ipython \
  pytest \
  ruff \
  mypy \
  pipdeptree 
 
  
  
RUN curl -fsSL https://opencode.ai/install | bash
RUN . /root/.bashrc
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint to our script
ENTRYPOINT ["entrypoint.sh"]

CMD ["bash"]
