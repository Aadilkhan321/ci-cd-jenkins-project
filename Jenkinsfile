pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                // ✅ Pull latest code from your actual GitHub repo
                // 🔹 If repo is public → you can leave out credentialsId
                // 🔹 If repo is private → add your Jenkins credentialsId (replace 'github-cred')
                git branch: 'main',
                    url: 'https://github.com/Aadilkhan321/ci-cd-jenkins-project.git'
                // If private repo, use this instead:
                // git branch: 'main', credentialsId: 'github-cred', url: 'https://github.com/Aadilkhan321/ci-cd-jenkins-project.git'
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

                    // 🧹 Stop & remove old container safely (no failure if missing)
                    bat '''
                    echo Checking for existing container...
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

    post {
        success {
            echo "🎉 Jenkins Pipeline executed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Please check the error logs."
        }
    }
}
