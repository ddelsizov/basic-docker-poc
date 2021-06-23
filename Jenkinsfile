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
    response = sh(
      returnStdout: true, 
      script: "curl --write-out %{http_code} http://localhost:80");
       def status = (response =~ /(?s).*HTTP/1.1 (\d{3}).*/);
        if (status == 200) {
         echo 'Status 200, OK'
         } 
	    else {
         echo 'Status NOT OK'
                    }
                }
            }
        }
    }
}
