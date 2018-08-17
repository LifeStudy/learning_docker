# learning_docker
Learning Docker

Step

* Create Dockerfile
* docker build -t="react-native" . - same directory of the dockerfile.
* docker commit $(docker ps -l -q) react-native:js
* docker tag react-native:js arjaraujo/react-native-android
* docker push arjaraujo/react-native-android
