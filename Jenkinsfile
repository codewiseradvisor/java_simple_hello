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

        stage('Copy Artifact to Local Machine') {
            steps {
                sh "cp target/Codewise-0.0.1-SNAPSHOT.jar /var/lib/jenkins/workspace/test"
            }
        }
    }
}
