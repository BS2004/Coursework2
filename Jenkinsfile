pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
               checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building docker image cw2-server"
                    sh 'docker build -t cw2-server:1.0 .'
                }
            }
        }

        stage('Test Docker Container') {
            steps {
                script {
		    echo "Running test container"

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
                    withCredentials([usernamePassword(credentialsId: '5931d32b-7202-43a3-8071-506c31d6e909', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker login -u bstewa301 -p cyberwolF21?"
		        sh "docker tag cw2-server:1.0 bstewa301/cw2-server:1.0"
			sh "docker push bstewa301/cw2-server:1.0"
                    }

                }
            }
        }
    }

}
