pipeline {
    agent any

    environment {
        DOCKERHUB_CREDS = credentials('dockerhub-creds') // This is your Jenkins ID
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/pramodtechrabbit-png/dummy-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("pramod001/dummy-app:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-creds') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh """
                docker stop dummy-app || true
                docker rm dummy-app || true
                docker run -d -p 8080:80 --name dummy-app pramod001/dummy-app:${env.BUILD_NUMBER}
                """
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed. Check logs."
        }
    }
}