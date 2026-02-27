pipeline {
    agent any
    environment {
        DOCKER_HUB_CRED = 'dockerhub-creds' // Jenkins credentials ID
        IMAGE_NAME = 'pramod001/dummy-qa-app-new'
        TAG = 'latest'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/pramodtechrabbit-png/dummy-app-new.git'
            }
        }
        stage('Docker Build') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${TAG} ."
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CRED, usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh "docker push ${IMAGE_NAME}:${TAG}"
                }
            }
        }
        stage('Deploy') {
            steps {
                sh "docker rm -f dummy-qa-new || true"
                sh "docker run -d -p 8082:80 --name dummy-qa-new ${IMAGE_NAME}:${TAG}"
            }
        }
    }
}