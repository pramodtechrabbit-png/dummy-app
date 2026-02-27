pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/pramodtechrabbit-png/dummy-app.git'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t dummy-qa-app:latest .'
            }
        }
        stage('Docker Run') {
            steps {
                sh 'docker rm -f dummy-qa-app || true'
                sh 'docker run -d -p 8081:80 --name dummy-qa-app dummy-qa-app:latest'
            }
        }
    }
}