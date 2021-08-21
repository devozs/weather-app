# Weather App
#### A Java, Maven, Docker and simple CI example project

### Key Features 🔑

- Java and Maven implementation
- Docker container using Dockerfile and docker build
- CI for building the project and pushing the image to docker registry via 
  - [Jenkins pipeline](https://www.google.com)
  - [Bash script](https://www.google.com)
- [Setup required tools script](https://www.google.com)

---

### Building the project 🚪

    cd ~/[your-workspace]
    git clone https://github.com/devozs/weather-app.git
    mvn clean install

### Building and pushing the docker image (locally) 🚪
Running a utility script you can build the project and the image
```shell
./build-push-image.sh
```
| Example                                       | Comments           
| ----------------------------------------------|-----------------------------------------------------------------------|
| ```shell ./build-push-image.sh```             | Running mvn install and building the image with latest tag
| ```shell ./build-push-image.sh -t 0.0.1```    | Same as above and also tagging the image with specific tag
| ```shell ./build-push-image.sh -t 0.0.1 -p``` | Same as above and also pushing the image to docker hub

### Jenkins Pipeline 🌩️
A simple Jenkinsfile implementation that demonstrates CI pipeline.
######Once the repository has been cloned make sure to update the docker hub repository and credentials

## [Deploying and running the project](https://www.google.com)🌩️