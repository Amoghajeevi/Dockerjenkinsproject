pipeline {
    agent any
    environment {
HEAD
        DOCKER_HUB_REPO = 'amoghajeevi/dockerjenkinsproject'
        DOCKER_HUB_REPO = 'yourusername/dockerjenkinsproject
	 cb219e7 (initial app commit)
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Amoghajeevi/Dockerjenkinsproject.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_HUB_REPO:latest .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh 'docker push $DOCKER_HUB_REPO:latest'
                }
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'docker run -d --name jenkins-app -p 4000:4000 $DOCKER_HUB_REPO:latest'
            }
        }
    }
}
