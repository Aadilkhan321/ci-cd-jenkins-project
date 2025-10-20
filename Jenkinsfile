pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                script {
                    // 🐳 Build the Docker image from your Dockerfile
                    bat 'docker build -t mydevopswebsite:latest .'
                }
            }
        }

        stage('Deploy Website') {
            steps {
                script {
                    // 🧹 Safely stop & remove existing container (no errors if not found)
                    powershell '''
                    try { docker stop mydevops-container } catch { Write-Host "No running container to stop." }
                    try { docker rm mydevops-container } catch { Write-Host "No container to remove." }
                    '''

                    // 🚀 Run new container on port 8080
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
