#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGE="myridia/opencode:latest"
NAME="opencode_shell"

task=""
until [ "$task" = "0" ]; do
  os="$(uname -s)"
  case "$os" in
    Darwin) os="macos" ;;
    Linux) os="linux" ;;
  esac

  echo
  echo "opencode_docker ($os, image $IMAGE)"
  echo "TaskID  Description"
  echo "1      Build - docker build -t $IMAGE"
  echo "2      Run - start container, asks which folder to share"
  echo "3      Status - show this project's containers"
  echo "4      Stop - stop the container"
  echo "5      Enter - shell into the running container"
  echo "6      Remove container"
  echo "7      Remove image"
  echo "0      Exit"
  printf "> "
  read -r task

  case "$task" in
    1)
      docker build -t "$IMAGE" "$DIR" && echo "ok: built $IMAGE" || echo "FAIL: build"
      ;;
    2)
      printf "Folder to share with the container (enter for none): "
      read -r share
      share="${share/#\~/$HOME}"
      if [ -n "$share" ] && [ ! -d "$share" ]; then
        echo "FAIL: no such folder: $share"
        continue
      fi
      args=(run -it --privileged --name "$NAME")
      if [ -n "$share" ]; then
        args+=(-v "$share":/workspace -w /workspace)
        echo "sharing $share -> /workspace"
      fi
      docker "${args[@]}" "$IMAGE" bash
      ;;
    3)
      docker ps -a --filter "name=opencode_"
      ;;
    4)
      docker stop "$NAME" && echo "ok: stopped $NAME" || echo "FAIL: stop"
      ;;
    5)
      docker exec -it "$NAME" bash
      ;;
    6)
      docker rm -f "$NAME" && echo "ok: removed $NAME" || echo "FAIL: remove"
      ;;
    7)
      docker rmi "$IMAGE" && echo "ok: removed $IMAGE" || echo "FAIL: remove"
      ;;
    0)
      break
      ;;
    *)
      echo "unknown task: $task"
      ;;
  esac

  sleep 3
  exec "$DIR/ask.sh"
done
