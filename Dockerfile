# docker build -t py-image-v1 .

FROM python:3.6
RUN apt-get update
RUN apt-get install -y lsof
RUN apt-get install -y vim
RUN apt-get install -y htop


RUN mkdir /py-image
WORKDIR /py-image
COPY . /py-image

# Install libraries needed for the project
# RUN pip install packages/*.whl
# RUN pip install packages/*.zip
# RUN pip install aliyun-python-sdk-core-v3
# Aliyun service SDK
# RUN pip install aliyun-python-sdk-ecs
RUN pip install --upgrade pip
# ERROR: botocore 1.15.29 has requirement docutils<0.16,>=0.10, but you'll have docutils 0.16 which is incompatible.
# ERROR: apache-airflow 1.10.9 has requirement jinja2<2.11.0,>=2.10.1, but you'll have jinja2 2.11.1 which is incompatible.
# ERROR: apache-airflow 1.10.9 has requirement werkzeug<1.0.0, but you'll have werkzeug 1.0.0 which is incompatible.
RUN pip install -r requirements.txt
RUN pip install torch==1.4.0+cpu torchvision==0.5.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

# jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
# nohup jupyter lab --ip 0.0.0.0 --no-browser --allow-root --port 8080 &
# lsof -i :8080
# RUN jupyter lab --port {your_port}
# RUN jupyter lab --ip=127.0.0.1 --port=8888

# PORT
EXPOSE 8080



# RUN python server.py
##### docker run -d -P <image_id> python app_uploader.py
##### docker run -d -p 5050:5050 <image_id> python app_uploader.py
##### docker exec -it <container_id> bash
##### python service_watcher.py /upload-tornado-image/uploader/files &
####### ./ngrok http 32773


# docker run -d -p 8080:8080 <image_id> jupyter lab --ip 0.0.0.0 --no-browser --allow-root --port 8080 &

#### get token
#### to to container
#### docker exec -it <container_id> bash
# docker exec -it 69362a916399 bash
# jupyter notebook list
#### http://0.0.0.0:8080/?token=833918a05f17ff546ed092c465c4a54fd64c14c2c5b3b311 :: /py-image
# set password




