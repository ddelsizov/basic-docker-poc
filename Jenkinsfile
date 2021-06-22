pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
                sh 'git clone https://github.com/ddelsizov/basic-docker-poc /opt/jenkins/projects/docker' 
            }
        stage('Stage 2') {
            steps {
                sh 'docker image build -t apache-1 /opt/jenkins/projects/docker/Dockerfile' 
            }
        }
      
    }
}
