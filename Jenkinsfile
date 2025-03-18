pipeline {
    agent any
    environment {
        DOCKER_HUB_REPO = 'yourusername/docker-jenkins-app'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yourusername/Docker-Jenkins-CI-CD.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t :latest .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh 'docker push :latest'
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'docker run -d --name jenkins-app -p 4000:4000 :latest'
            }
        }
    }
}
