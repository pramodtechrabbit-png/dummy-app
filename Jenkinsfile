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
                // Always build the image, even if it existed
                sh 'docker build -t dummy-qa-app:latest .'
            }
        }
        stage('Docker Deploy') {
            steps {
                // Remove old container if exists
                sh 'docker rm -f dummy-qa-app || true'
                
                // Run new container
                sh 'docker run -d -p 8081:80 --name dummy-qa-app dummy-qa-app:latest'
            }
        }
    }
}