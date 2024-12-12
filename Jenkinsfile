pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from Git repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t cw2-server:1.0 .'
                }
            }
        }

        stage('Test Docker Container') {
            steps {
                script {
                    sh 'docker run -d --name test-container cw2-server:1.0'

                    sh 'docker ps'

                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    sh 'docker rm -f test-container'
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo cyberwolF21? | docker login -u bstewa301 --password-stdin'
                    }

                    sh 'docker tag cw2-server:1.0 bstewa301/cw2-server:1.0'

                    sh 'docker push bstewa301/cw2-server:1.0'
                }
            }
        }
    }

    post {
        always {
            sh 'docker system prune -f'
        }
    }
}
