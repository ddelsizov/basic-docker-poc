pipeline {
    agent any
    stages {
       stage('Build') {
         steps {
          sh 'rm -rf /opt/jenkins/projects/docker/*'
          sh 'git clone https://github.com/ddelsizov/basic-docker-poc /opt/jenkins/projects/docker'
          sh 'docker image build -t apache-1 /opt/jenkins/projects/docker/ .'
      }
        }
        stage('Run') {
          steps {
           sh 'docker container run -d -p 8888:80 --name apache-web apache-1'
      }
        }
        stage('test3') {
            steps {
               sh(returnStdout: true, script: '''
			   #!/bin/bash
			   status='curl -o --write-out "%{http_code}\n" -sfI "http://localhost:80"'
                           if $status == 200 
		           echo "Status 200, OK" 
	                   else 
		           echo "Status is $status, not OK"
		       ''')
	      }
            }
        }
    }
