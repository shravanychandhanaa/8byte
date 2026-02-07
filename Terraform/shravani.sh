#!/bin/bash
sudo apt-get update -y && sudo apt-get install -y docker.io
sudo systemctl enable docker 
sudo systemctl start docker
sudo usermod -aG docker ubuntu
docker pull shravanychandhanaa/8byte-intern-app
docker run -d -p 3000:3000 shravanychandhanaa/8byte-intern-app