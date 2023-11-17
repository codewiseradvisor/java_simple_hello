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


        stages {
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

//         stage("Stop old containers"){
//             steps{
//                 script{
//                     sh "docker stop \$(docker ps -q)"
//                 }
//             }
//         }
//
//         stage("Cleanup old containers"){
//             steps{
//                 script{
//                     sh "docker rm -f \$(docker ps -aq)"
//                 }
//             }
//         }
//         stage("Cleanup old images"){
//             steps{
//                 script{
//                     sh "docker rmi -f \$(docker images -aq)"
//                 }
//             }
//         }

        stage("Run Docker Compose") {
            steps {
                script {
                    sh "docker compose up -d"
                }
            }
        }

//         stage("Run Docker Container") {
//             steps {
//                 script {
//                     sh "docker run -p 8001:8001 -d my-spring-app"
//                 }
//             }
//         }
    }
}
