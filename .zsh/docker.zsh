bashlast() {
  IMAGE=`docker images | head -n 2 | tail -n 1 | awk '{print $3}'`
  docker run -it $IMAGE /bin/bash
}