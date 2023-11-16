node {
  stage("Clone the project") {
    git branch: 'main', url: 'https://github.com/codewiseradvisor/java_simple_hello.git'
  }

 stage("Compilation and Tests") {
    sh "./mvnw clean install -DskipTests"
    sh "./mvnw test -Punit"
  }

  stage("Build Docker Image") {
    sh "docker build -t my-spring-app ."
  }

  stage("Run Docker Container") {
    sh "docker run -p 8001:8001 my-spring-app"
  }
}
