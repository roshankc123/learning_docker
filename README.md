# docker basics

ref: <https://docker-curriculum.com/#introduction>

docker pull 'image name'
docker run -dit --name 'conta name' 'coker image name' /usr/bin/top -b
docker % docker exec -it great_nash /bin/bash

## introduction

package an application with all of its dependencies into a standardized unit for software development
unlinke VMs which has high overhead and need more computation power, docker has low overhead
each os is sandboxed and called containers
Containers offer a logical packaging mechanism
This gives developers the ability to create predictable environments with isolation from rest
portable
provide a safe ground to test commands( like rm -rf)
docker images are the blueprint or checkpoint from which our container is made
docker images are available in docker hub, a registry of docker images
there are base image( eg. ubuntu, debian etc) and child images (eg. nginx, apache)
also, official images and user images(unofficial)
it's a good strategy to decouple your application tiers, it is wise to keep containers for each of the services separate. Each tier is likely to have different resource needs and those needs might grow at different rates. By separating the tiers into different containers, we can compose each tier using the most appropriate instance type based on different resource needs. (microervice architecture)

## commands

1. docker pull {image_name:version|null}
2. docker search {image_name} -> search docker hub for images
3. docker images -> list locally available images
4. docker run busybox echo 'hello'  -> printed hello
5. docker run -it busybox sh -> open interactive tty shell
6. docker run -it --detach busybox sh -> run, detach and return id
7. docker rm {continer_id} -> remove container
8. docker rmi {image_name} -> remove cloned image
9. docker container prune -> remove all stopped container
10. docker stop {container name|id} -> stops the container
11. docker commit container newimage -> creating new image from existing container

## commands options

- docker ps : list all running container
- docker ps -a : list all ever existed along with last command executed
- -it : interactive tty (not needed in detach mode)
- --detach or -d :  detach the container and return id
- --rm : with run, delete container when exited
- --name : naming the container while runnning
- -P(cap) : assign randomport number to all exposed port
- -p(lower) {from:to} : proxy the ports

## create a new image

1. create Dockerfile
2. build Dockerfile with -t {name}
