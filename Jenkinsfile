pipeline {
    agent none
    stages {
      stage('build') {
         agent {
        docker { image 'python:3.7.12' }
      }
        input{
              message 'Press OK to Proceed'
              parameters {
                  string(name:'username', defaultValue: 'user', description: 'Type your username')
                  string(name:'environment', defaultValue: 'dev', description: 'Type which environment you want to deploy to')
          }
        }
        steps {
          sh '''
              python3 -m venv .venv
              . .venv/bin/activate
              pip3 install -r requirements.txt
              echo The variable ${environment} can be used inside the Docker Container
          '''
        }
      }
      stage('test') {
        agent {
          docker { image 'python:3.7.12' }
        }
        steps {
          sh '''
              . .venv/bin/activate
              python3 test.py
          '''
        }
      }
      stage('deploy') {
        agent any
        steps {
          sh '''
              docker --version
              echo 'Deployed...'
          '''
        }
      }
    }
  }
