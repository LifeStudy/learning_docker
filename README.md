# learning_docker
Learning Docker


## Install
  * sudo apt-get install git build-essential

  * sudo apt-get -y install curl apt-transport-https ca-certificates software-properties-common

  * curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  * sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

  * sudo apt-get update

  * sudo apt-get install docker-compose docker docker-ce



## Step

* Create Dockerfile - get my dockerfile example
* ./build_docker.sh . - same directory of the dockerfile.
* docker commit $(docker ps -l -q) react-native:js - recommend put " user/repository:tag " hub docker. For Ex: arjaraujo/react-native:js
* docker tag arjaraujo/react-native:js arjaraujo/react-native:js
* docker push arjaraujo/react-native:js
