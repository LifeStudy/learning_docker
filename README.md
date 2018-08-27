# learning_docker
Learning Docker


## Install
  
  * sudo apt-get -y install curl apt-transport-https ca-certificates software-properties-common

  * curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  * sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

  * sudo apt-get update

  * sudo apt-get install docker-compose docker docker-ce



## Step

* Create Dockerfile
* docker build -t="react-native" . - same directory of the dockerfile.
* docker commit $(docker ps -l -q) react-native:js
* docker tag react-native:js arjaraujo/react-native-android
* docker push arjaraujo/react-native-android
