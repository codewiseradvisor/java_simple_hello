pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/codewiseradvisor/java_simple_hello.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Run Spring Boot App') {
            steps {
                sh "mvn spring-boot:run"
            }
        }
    }
}
