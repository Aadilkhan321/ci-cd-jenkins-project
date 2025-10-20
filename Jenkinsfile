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
                    // Safely stop & remove container if exists (PowerShell ignores errors)
                    bat 'powershell -Command "docker stop mydevops-container -ErrorAction SilentlyContinue; docker rm mydevops-container -ErrorAction SilentlyContinue"'
                    // Start new container
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
