pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'amoghajeevi/dockerjenkinsproject:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Amoghajeevi/Dockerjenkinsproject.git'
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
                script {
                    sh 'docker login -u amoghajeevi -p 1amHarsha!'
                    sh 'docker push amoghajeevi/dockerjenkinsproject:latest'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker stop dockerjenkinsproject || true && docker rm dockerjenkinsproject || true'
                    sh 'docker run -d -p 3000:3000 --name dockerjenkinsproject $DOCKER_IMAGE'
                }
            }
        }
    }
}
