pipeline {
    agent any

    stages {

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
