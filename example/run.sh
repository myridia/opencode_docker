kitty docker run -it --network host -e ALL_PROXY=socks5h://127.0.0.1:9999 -v "$(pwd)/proxychains.conf":/etc/proxychains.conf myridia/opencode bash
