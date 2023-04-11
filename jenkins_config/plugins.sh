#!/bin/sh
sudo apt-get update
sudo apt-get install -y $(< /usr/share/jenkins/plugins.txt)