
## ![Docker Opencode](pages/public/img/icon_512x512.png) Docker Opencode


## How to use 
1. Run this command in a OSC52-compatible terminal like Kitty, Wezterm or Alacritty
```
docker run -it --privileged myridia/opencode bash
```

2. Type into the Terminal: 
```
opencode
```

### Docker-in-Docker

The image ships `docker.io` + `docker-cli`; the entrypoint starts its own
`dockerd`, so with `--privileged` you can build and run nested containers
right inside the shell:

```
docker ps
docker build -t foo .
```

### Example with kitty and mount my folder ai to the docker home root directory 
```
kitty docker run -it --privileged -v /home/veto/ai:/root/ai  myridia/opencode bash
```
## Enter into the Terminal
```
opencode
```


## Extra Repository ##
```
 git remote add codeberg ssh://git@codeberg.org/veto/opencode_docker
 git push codeberg -f

```
