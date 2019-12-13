#! /bin/bash

sudo apt-get update
sudo apt-get install -y apt-transport-https

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubectl

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -

sudo apt-get update
sudo apt-get install -y virtualbox

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/
minikube start --vm-driver=virtualbox
