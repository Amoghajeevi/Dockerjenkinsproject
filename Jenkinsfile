pipeline {
    agent {
        docker {
            image 'python:3.8-slim'
        }
    }
    environment {
        DOCKER_IMAGE = 'amoghajeevi/dockerjenkinsproject:latest'
        DOCKER_CREDENTIALS = 'dockerhub'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Amoghajeevi/Dockerjenkinsproject.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: DOCKER_CREDENTIALS, url: 'https://index.docker.io/v1/']) {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'docker stop dockerjenkinsproject || true && docker rm dockerjenkinsproject || true'
                sh 'docker run -d -p 3000:3000 --name dockerjenkinsproject $DOCKER_IMAGE'
            }
        }
    }
}
