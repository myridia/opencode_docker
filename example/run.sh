#kitty docker run -it --network host -e ALL_PROXY=socks5h://127.0.0.1:9999 -v "$(pwd)/proxychains.conf":/etc/proxychains.conf myridia/opencode bash
#kitty docker run -it --network host -e myridia/docker_trixy bash
kitty docker run -it --network host --cap-add NET_ADMIN -v ~/webs/opencode_docker/example/setup-redsocks.sh:/tmp/setup-redsocks.sh:ro myridia/trixie bash -c "bash /tmp/setup-redsocks.sh && exec bash"
#kitty docker run -it --network host --cap-add NET_ADMIN -v ~/webs/opencode_docker/example/setup-redsocks.sh:/tmp/setup-redsocks.sh:ro myridia/opencode bash -c "bash /tmp/setup-redsocks.sh && exec bash"
