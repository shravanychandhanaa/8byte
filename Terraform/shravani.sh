#!/bin/bash
sudo apt-get update -y && sudo apt-get install -y docker.io
sudo systemctl enable docker 
sudo systemctl start docker
sudo usermod -aG docker ubuntu