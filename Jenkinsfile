node {
  stage("Clone the project") {
    git branch: 'main', url: 'https://github.com/codewiseradvisor/java_simple_hello.git'
  }

 stage("Compilation and Tests") {
    sh "./mvnw clean install -DskipTests"
    sh "./mvnw test -Punit"
  }
  stage("Tests files") {
      sh "ls"
      sh "pwd"
    }

  stage("Build Docker Image") {
    sh "sudo -S docker build -t my-spring-app ."
  }

  stage("Run Docker Container") {
    sh "sudo -S docker run -p 8001:8001 my-spring-app"
  }
}
