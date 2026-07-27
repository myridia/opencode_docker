## run Proxy
```
docker run -d --name proxy --cap-add=NET_ADMIN --add-host=host.docker.internal:host-gateway myridia/proxy
```

## test
```
docker run --network container:proxy -it myridia/trixie bash
curl api.ipify.org
```




## Apply
```
kitty docker run -it  --network container:proxy -v /home/veto/webs:/home/veto/webs  myridia/opencode bash
```
