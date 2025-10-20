pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                // ✅ Clone from your GitHub repo
                git branch: 'main',
                    url: 'https://github.com/Aadilkhan321/ci-cd-jenkins-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "🛠️ Building Docker Image..."
                    bat 'docker build -t mydevopswebsite:latest .'
                }
            }
        }

        stage('Deploy Website') {
            steps {
                script {
                    echo "🚀 Deploying Docker Container..."

                    // 🧹 Safely stop/remove old container (ignore Docker errors)
                    bat '''
                    echo Checking for existing container...
                    docker stop mydevops-container >nul 2>&1 || echo No running container
                    docker rm mydevops-container >nul 2>&1 || echo No container to remove
                    '''

                    // 🚀 Run new container
                    bat 'docker run -d -p 8080:80 --name mydevops-container mydevopswebsite:latest'
                }
            }
        }

        stage('Post Actions') {
            steps {
                script {
                    echo "✅ Deployment Completed Successfully!"
                    bat 'docker ps'
                }
            }
        }
    }

    post {
        success {
            echo "🎉 Jenkins Pipeline executed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Please check the error logs."
        }
    }
}
