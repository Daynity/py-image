#### Exclusively to the only Xixilini! Other people back-off pls!  
 
---
 
#### 1. Build image 
python3.6 image with given requirements.txt. Note tensorflow and pytorch are using cpu-version. 
 
```bash
# docker build -t <REPOSITORY-NAME> .
docker build -t py-image-v1 .
```

--- 

#### 2. Start container
```bash
# show all built images  
docker images 
```
![Alt text](img/docker-images.png?raw=true "Title")

```bash
# start jupyter lab (port 8080) and map the port to server port 8080
# docker run -d -p 8080:8080 <image-id> jupyter lab --ip 0.0.0.0 --no-browser --allow-root --port 8080 &
docker run -d -p 8080:8080 5b8ccffc4248 jupyter lab --ip 0.0.0.0 --no-browser --allow-root --port 8080 &
```

Go to the container and get jupyter token, and use the token to reset a new password. 
```bash 
docker ps
# docker exec -it <container_id> bash
docker exec -it 18882ccb0b4c bash
jupyter notebook list
#  http://0.0.0.0:8080/?token=451502b7a53e95b717702fca0cc6b555915865b4ec25ec06 :: /py-image
# the token is 451502b7a53e95b717702fca0cc6b555915865b4ec25ec06
```

![Alt text](img/reset-pwd.png?raw=true "Title")

Jupyter lab now works on http://0.0.0.0:8080/lab!

![Alt text](img/jlab.png?raw=true "Title")
 
--- 

#### 3. Limited resource 
![Alt text](img/limit-resource.png?raw=true "Title")

Ref: https://docs.docker.com/config/containers/resource_constraints/

--- 

#### 4. Docker cheat sheet 

```bash 
# docker cheat sheet 
https://docs.docker.com/engine/reference/builder/
https://yeasy.gitbooks.io/docker_practice/network/port_mapping.html


# build a docker image 
docker build .

docker build -t dan-tmp .

# rebuild a docker image from 0 
docker build --no-cache .


# check running docker images
docker ps -a

# get all active and inactive images: 
docker container ls -a
docker container rm cc3f2ff51cab cd20b396a061
docker container port e248a847046b


# remove images 
docker images 
docker image rm xxxxx 
docker image rm -f 5af5c0ebc9a6  # remove by force 
# or 
docker rmi -f 5af5c0ebc9a6


# run a built docker image and start a bash terminal 
docker run -it 48184f276396 /bin/bash

docker ps 
# CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
# e248a847046b        48184f276396        "/bin/bash"         7 minutes ago       Up 7 minutes                            modest_cartwright
# go inside a container 
docker exec -it e248a847046b bash
lsof -i :5002
docker stop container_id
docker container stop e248a847046b


映射docker端口到外面
https://yeasy.gitbooks.io/docker_practice/network/port_mapping.html
https://www.cnblogs.com/linjiqin/p/8670798.html
# 启动docker image
docker build -t bn2kills .
    docker run -d -P <image_name/id> python <api.py>
docker run -d -p 5002:5002 bn2skills-v2 python api.py
docker run -d -p 5002:5002 bn2skills-v1 /bin/bash
docker run -i -t bn2skills-v1 /bin/bash
docker ps 
docker container ls -l

 
# find port
docker port <container_name/id> 5002
docker port <container_name/id> 
```


