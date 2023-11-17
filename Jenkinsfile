pipeline {
    agent any

    stages {
        stage("Clone the project") {
            steps {
                git branch: 'main', url: 'https://github.com/codewiseradvisor/java_simple_hello.git'
            }
        }

        stage("Compilation and Tests") {
            steps {
                sh "./mvnw clean install -DskipTests"
                sh "./mvnw test"
            }
        }

        stage("Tests files") {
            steps {
                sh "ls"
                sh "pwd"
            }
        }

        stage("Stop old containers"){
            steps{
                script{
                    sh "docker ps -aq | xargs -r docker stop"
                }
            }
        }

        stage("Cleanup old containers"){
            steps{
                script{
                    sh "docker ps -aq | xargs -r docker rm -v"
                }
            }
        }
        stage("Cleanup old images"){
            steps{
                script{
                    sh "docker images -aq | xargs -r docker rmi -f"
                }
            }
        }

        stage("Build Docker Image") {
            steps {
                script {
                    sh "docker build -t my-spring-app ."
                }
            }
        }

        stage("Run Docker Container") {
            steps {
                script {
                    sh "docker run -p 8001:8001 -d my-spring-app"
                }
            }
        }
    }
}
