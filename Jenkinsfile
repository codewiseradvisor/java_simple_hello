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

        stage("Conditional Docker Compose Down") {
            steps {
                script {
                    if (fileExists('docker-compose.yml')) {
                        sh 'docker-compose down --rmi all'
                        sh 'rm docker-compose.yml'
                    } else {
                        echo "docker-compose.yml not found"
                    }
                }
            }
        }

        stage("Run Docker Compose") {
            steps {
                script {
                    sh "docker compose up -d"
                }
            }
        }
    }
}
