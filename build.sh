#!/bin/bash

cd /root/ansible

docker build -t $JOB_NAME:$BUILD_ID .

docker tag $JOB_NAME:$BUILD_ID ciasharmma/$JOB_NAME:$BUILD_ID

docker tag $JOB_NAME:$BUILD_ID ciasharmma/$JOB_NAME:latest

docker push ciasharmma/$JOB_NAME:$BUILD_ID

docker push ciasharmma/$JOB_NAME:latest

docker rmi -f $JOB_NAME:$BUILD_ID ciasharmma/$JOB_NAME:$BUILD_ID ciasharmma/$JOB_NAME:latest
