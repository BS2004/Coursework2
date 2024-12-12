pipeline {
    agent any

 stage('Remove Container') {
            steps {
                script {
                    sh "docker rm -f test-container"
                }
            }
        }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/BS2004/Coursework2'  // Replace with your GitHub repository URL
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image: cw2-server:1.0"
                    sh "docker build -t cw2-server:1.0 ."
                }
            }
        }
        
        stage('Run Container and Test') {
            steps {
                script {
                    echo "Testing Docker container launch..."
                    sh "docker run -d --name test-container cw2-server:1.0"
                    
                    def containerStatus = sh(script: "docker ps -q --filter name=test-container", returnStdout: true).trim()
                    if (containerStatus) {
                        echo "Docker container launched successfully."
                    } else {
                        error "Failed to launch Docker container."
                    }
                }
            }
        }

        stage('Remove Container') {
            steps {
                script {
                    echo "Removing the container..."
                    sh "docker rm -f test-container"
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                script {
                    echo "Pushing Docker image to Docker Hub..."
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker login -u bstewa301 -p cyberwolF21?"
                        sh "docker tag cw2-server:1.0 bstewa301/cw2-server:1.0"
                        sh "docker push bstewa301/cw2-server:1.0"
                    }
                }
            }
        }
    }


