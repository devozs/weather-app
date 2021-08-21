# Weather App
#### A Java, Maven, Docker and simple CI example project

### Key Features 🔑

- Java and Maven implementation
- Docker container using Dockerfile and docker build
- CI for building the project and pushing the image to docker registry via 
  - [Jenkins pipeline](https://github.com/devozs/weather-app/blob/dev/Jenkinsfile)
  - [Bash script](https://github.com/devozs/weather-app/blob/dev/build-push-image.sh)
- [Setup required tools script](https://github.com/devozs/weather-app/blob/dev/setup-prerequisites.sh)

---

### Building the Java project 🚪

    cd ~/[your-workspace]
    git clone https://github.com/devozs/weather-app.git
    mvn clean install

### Building and pushing the docker image (locally) 🚪
Running a utility script you can build the project and the image
```shell
./build-push-image.sh
```
| Example                                 | Comments           
| ----------------------------------------|-----------------------------------------------------------------------|
| ```./build-push-image.sh```             | Running mvn install and building the image with latest tag
| ```./build-push-image.sh -t 0.0.1```    | Same as above and also tagging the image with specific tag
| ```./build-push-image.sh -t 0.0.1 -p``` | Same as above and also pushing the image to docker hub

### Jenkins Pipeline 🌩️
A simple Jenkinsfile implementation that demonstrates CI pipeline.
####The pipeline is
- Getting sources from GitHub
- Running  mvn build
- Running Docker build
- Pushing the image to DockerHub
######Once the repository has been cloned make sure to update the github repository, docker hub repository and credentials
######Make sure to have docker installed on the jenkins VM

The pipeline is for testing purposes and its creating image tag with Jenkins build number. As such make sure to manually delete created images.

## [Deploying and running the project](https://www.google.com) 🌩️