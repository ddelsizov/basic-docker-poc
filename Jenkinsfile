pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'rm -rf /opt/jenkins/projects/*'
        sh 'git clone https://github.com/ddelsizov/basic-docker-poc /opt/jenkins/projects/docker'
        sh 'docker image build -t apache-1 /opt/jenkins/projects/docker/'
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
options='--fail --connect-timeout 3 --retry 0 -s -o /dev/null -w %{http_code}'
page="https://localhost:80"
outstr=$(curl $options $page)
retVal=$?
[[ $retVal -eq 0 ]] || { echo "ERROR should have been able to pull $page, retVal=$retVal, code=$outstr"; exit 4; }
echo "OK pulling from $page successful, retVal=$retVal, code=$outstr"
		       ''')
      }
    }

  }
}
