#!/usr/bin/env bash

IP=ocp.datr.eu
USER=justin
PROJECT=jupyterhub-gpu

oc login https://${IP}:8443 -u $USER

oc delete project $PROJECT
oc new-project $PROJECT 2> /dev/null
while [ $? \> 0 ]; do
    sleep 1
    printf "."
oc new-project $PROJECT 2> /dev/null
done


oc new-app jupyterhub-gpu.yml