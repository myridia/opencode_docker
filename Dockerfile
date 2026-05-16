FROM debian:latest
LABEL version="0.1"
MAINTAINER veto<veto@myridia.com>
RUN apt-get update -y && apt-get install -y \
  curl\ 
  tree
RUN curl -fsSL https://opencode.ai/install | bash
RUN . /root/.bashrc
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint to our script
ENTRYPOINT ["entrypoint.sh"]

CMD ["bash"]
