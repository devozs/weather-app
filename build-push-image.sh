#!/bin/bash

# # # # # # # # # # # # # # # #
# For local testing purposes  #
# # # # # # # # # # # # # # # #

#!/bin/bash

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
reset=$(tput sgr0)

PUSH_IMAGE="false"
IMAGE_PREFIX="devozs"
IMAGE_TAG="latest"

command -v docker >/dev/null 2>&1 || {
  echo >&2 "${red}I require docker but it's not installed.  Aborting."
  exit 1
}

Help() {
  echo "$(basename "$0") Java build using maven and docker build and push into Docker Hub"
  echo "1) In case of pushing image to Docker Hub make sure that you are logged into docker hub"
  echo
  echo "Examples:"
  echo " - './build-push-image.sh' will run maven and docker build"
  echo " - './build-push-image.sh -t use a specific image tag (default is latest)'"
  echo " - './build-push-image.sh -p will also push the build image into docker hub'"
  echo
  echo "Usage: $(basename "$0") [-h] [-b]"
  echo "Options:"
  echo "-h        Print this Help."
  echo "-p        Push image to Docker Hub"
  echo "-t        Image tag to be used, if empty use latest"
  echo
}

options=':t:ph'
while getopts $options option; do
  case "$option" in
  p) PUSH_IMAGE="true" ;;
  t) IMAGE_TAG=$OPTARG ;;
  h)
    Help
    exit
    ;;
  \?)
    echo "Unknown option: -$OPTARG" >&2
    exit 1
    ;;
  :)
    echo "Missing option argument for -$OPTARG" >&2
    exit 1
    ;;
  *)
    echo "Unimplemented option: -$OPTARG" >&2
    exit 1
    ;;
  esac
done

shift $((OPTIND - 1))

if (($# > 0)); then
  echo "No arguments are allowed, see below help"
  Help
  exit
fi

mvn clean install
docker build -f ./Dockerfile -t ${IMAGE_PREFIX}/weather-app:"${IMAGE_TAG}" .

if [[ ${PUSH_IMAGE} == 'true' ]]; then
  docker push ${IMAGE_PREFIX}/weather-app:"${IMAGE_TAG}"
fi

