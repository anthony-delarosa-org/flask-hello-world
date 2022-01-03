pipeline {
    agent none
    parameters{
        choice(choices: ['dev', 'stage', 'prod'], description: 'Name of the Environment', name: 'ENV')
        choice(choices: ['us-west-2', 'ca-central-1','us-east-1'], description: 'What AWS Region?', name: 'AWS_DEFAULT_REGION')
        string(defaultValue: "username", description: 'Please type your username', name: 'USERNAME')
    }
    stages {
      stage('build') {
         agent {
        docker { image 'python:3.7.12' }
      }
        steps {
          sh '''
              python3 -m venv .venv
              . .venv/bin/activate
              pip3 install -r requirements.txt
              echo The variable ${ENV} can be used inside the Docker Container
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
              echo The Username is ${USERNAME}
          '''
        }
      }
      stage('deploy') {
        agent any
        steps {
          sh '''
              docker --version
              echo Deployed and Approved by: ${USERNAME}
          '''
        }
      }
    }
  }
