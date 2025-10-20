pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                // Pull latest code from your GitHub repo
                git branch: 'main', url: 'https://github.com/YourUsername/DevOps-CICD-Website.git'
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

                    // 🧹 Stop and remove old container safely (no failure if missing)
                    bat '''
                    docker ps -a -q -f name=mydevops-container >nul
                    if %errorlevel%==0 (
                        docker stop mydevops-container || echo No running container
                        docker rm mydevops-container || echo No container to remove
                    ) else (
                        echo No existing container found
                    )
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
}
