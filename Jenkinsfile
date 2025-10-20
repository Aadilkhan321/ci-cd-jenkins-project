pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t mydevopswebsite:latest .'
                }
            }
        }

        stage('Deploy Website') {
            steps {
                script {
                    bat 'docker stop mydevops-container || echo "No existing container"'
                    bat 'docker rm mydevops-container || echo "No container to remove"'
                    bat 'docker run -d -p 8080:80 --name mydevops-container mydevopswebsite:latest'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Website Deployed Successfully!'
        }
        failure {
            echo '❌ Build Failed. Check logs!'
        }
    }
}
