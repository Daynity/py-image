####Exclusively to the only Xixilini! Other people back-off pls!  
 
#### 1. Build image 
python3.6 image with given requirements.txt. Note tensorflow and pytorch are using cpu-version. 
 
```bash
# docker build -t <REPOSITORY-NAME> .
docker build -t py-image-v1 .
```

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
 


#### 3. Limited resource 
![Alt text](img/limit-resource.png?raw=true "Title")

Ref: https://docs.docker.com/config/containers/resource_constraints/

