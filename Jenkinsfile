pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker stop $(docker ps -a -q)'
        sh 'docker rm $(docker ps -a -q)'
        sh 'rm -rf /opt/jenkins/projects/*'
        sh 'git clone https://github.com/ddelsizov/basic-docker-poc /opt/jenkins/projects/docker'
        sh 'docker image build -t apache-1 /opt/jenkins/projects/docker/'
      }
    }

    stage('Run') {
      steps {
        sh 'docker container run -d -p 80:80 --name apache-web apache-1'
      }
    }

    stage('Test') {
      steps {
        sh(returnStdout: true, script: '''
	#!/bin/bash
options=\'-o /dev/null -w %{http_code} -sfI\'
page="http://localhost:80"
outstr=$(curl $options $page)
retVal=$?
[[ $retVal -eq 0 ]] || { echo "ERROR should have been able to pull $page, retVal=$retVal, code=$outstr"; exit 4; }
echo "OK pulling from $page successful, retVal=$retVal, code=$outstr"
		       ''')
      }
    }

  }
}
