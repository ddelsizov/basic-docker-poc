pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'git clone https://github.com/ddelsizov/basic-docker-poc /opt/jenkins/projects/docker'
        sh 'docker image build -t apache-1 /opt/jenkins/projects/docker/Dockerfile'
      }
    }
    stage('Run') {
      steps {
        sh 'docker container run -d -p 8888:80 --name apache-web apache-1'
      }
    }
    stage('Test') {
     steps {
       script {
         if sh 'curl -sL -w http://localhost:80 -o /dev/null = "200"' {
           echo 'Docker image executed as expected'
             } else {
                 echo 'Image run failed :('
         }
     }
}
