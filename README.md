
## ![Docker Opencode](pages/public/img/icon_512x512.png) Docker Opencode


## How to use 
1. Run this command in a OSC52-compatible terminal like Kitty, Wezterm or Alacritty
```
docker run -it myridia/opencode bash
```

2. Type into the Terminal: 
```
opencode
```

### Example with kitty and mount my folder ai to the docker home root directory 
```
kitty docker run -it -v /home/veto/ai:/root/ai  myridia/opencode bash
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
