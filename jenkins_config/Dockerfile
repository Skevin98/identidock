FROM jenkins/jenkins
USER root
# intalle sudo
RUN apt-get update && apt-get install -y sudo
# installe les pkg necessaires pour installer docker
RUN sudo apt-get install -y apt-transport-https \
  ca-certificates curl gnupg2 software-properties-common lsb-release \
  && sudo mkdir -m 0755 -p /etc/apt/keyrings
# Get les credentials de docker et les ajoute dans un fichier docker.gpg
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# ajoute le fichier credential et le repository debian au dossier de repository source 
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
  | tee /etc/apt/sources.list.d/docker.list > /dev/null \
  && sudo apt-get update \
  && sudo apt-get -y install docker-ce docker-ce-cli containerd.io \
  docker-buildx-plugin docker-compose-plugin \
  && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers


USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
COPY plugins.sh /usr/local/bin/plugins.sh 
RUN /usr/local/bin/plugins.sh
