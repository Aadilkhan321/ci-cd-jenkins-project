pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
git branch: 'main', url: 'https://github.com/Aadilkhan321/ci-cd-jenkins-project.git'

            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t mydevopswebsite:latest .'
                }
            }
        }

        stage('Deploy Website') {
            steps {
                script {
                    sh 'docker rm -f mydevops-container || true'
                    sh 'docker run -d -p 8080:80 --name mydevops-container mydevopswebsite:latest'
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