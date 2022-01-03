pipeline {
  agent any
  stages {
    agent { docker { image 'python:3.7.12' } }
    stage('build') {
      steps {
        sh '''
            python3 -m venv .venv
            . .venv/bin/activate
            pip3 install -r requirements.txt
        '''
      }
    }
    stage('test') {
      agent { docker { image 'python:3.7.12' } }
      steps {
        sh '''
            . .venv/bin/activate
            python3 test.py
        '''
      }   
    }
    stage('deploy') {
      steps {
        sh '''
        docker --version
        echo 'Deploying something...'
        '''
      }   
    }
  }
}
