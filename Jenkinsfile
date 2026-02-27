pipeline {
    agent any

    stages {
        // 1️⃣ Pull latest code from GitHub
        stage('Checkout') {
            steps {
                git 'https://github.com/pramodtechrabbit-png/dummy-app.git'
            }
        }

        // 2️⃣ Build the Docker image
        stage('Docker Build') {
            steps {
                sh 'docker build -t dummy-qa-app:latest .'
            }
        }

        // 3️⃣ Deploy the Docker container
        stage('Docker Deploy') {
            steps {
                // Remove old container if exists
                sh 'docker rm -f dummy-qa-app || true'

                // Run a fresh container
                sh 'docker run -d -p 8081:80 --name dummy-qa-app dummy-qa-app:latest'
            }
        }
    }
}