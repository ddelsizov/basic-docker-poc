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
        stage('test3') {
            steps {
  script {
    def status = sh(
            script: '"curl -o /dev/null --write-out "%{http_code}" -sfI "http://localhost:80"; echo \\\$?"', returnStdout: true) as Integer
        if (status == 200) {echo 'Status 200, OK'} 
	    else {echo 'Status NOT OK}
                }
            }
        }
    }
}
