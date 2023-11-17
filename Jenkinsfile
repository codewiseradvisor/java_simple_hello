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
                sh 'docker ps -q | while read -r container_id; do docker stop "$container_id"; done'
            }
        }
        stage("Test docker1") {
             steps {
                 sh "docker ps"
                 sh "docker ps -l"
                 sh "docker images"
             }
        }
        stage("Cleanup old containers"){
            steps{
                sh "docker container prune -f"
            }
        }
        stage("Test docker2") {
                     steps {
                         sh "docker ps"
                         sh "docker ps -l"
                         sh "docker images"
                     }
                }
        stage("Cleanup old images"){
            steps{
                 sh "docker image prune -af"
            }
        }
        stage("Test docker3") {
                     steps {
                         sh "docker ps"
                         sh "docker ps -l"
                         sh "docker images"
                     }
                }

        stage("Build Docker Image") {
            steps {
                script {
                    sh "docker build -t my-spring-app ."
                }
            }
        }
        stage("Test docker4") {
                     steps {
                         sh "docker ps"
                         sh "docker ps -l"
                         sh "docker images"
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
