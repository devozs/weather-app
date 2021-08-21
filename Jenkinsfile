pipeline {
    agent any
    tools {
        maven "maven3.8.2"
    }

    environment {
        REGISTRY = "devozs"
        IMAGE_TAG = "0.0.${BUILD_NUMBER}"
    }

    stages {
        stage('SCM') {
            steps {
              git branch: 'dev', url: 'https://github.com/devozs/weather-app'
            }
        }

        stage('Maven Build') {
            steps {
              sh "mvn clean install"
            }
        }

        stage('Docker Build') {
            steps {
              sh "docker build -f ./Dockerfile -t ${REGISTRY}/weather-app-client:${IMAGE_TAG} ."
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPassword')]) {
                    sh "docker login -u ${REGISTRY} -p ${dockerHubPassword}"
                }
                sh "docker push ${REGISTRY}/weather-app-client:${IMAGE_TAG}"
            }
        }
    }
}