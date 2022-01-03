pipeline {
    agent none
    input{
        message 'Press OK to Proceed'
        submitter 'user1,user2'
        parameters {
            string(name:'username', defaultValue: 'user', description: 'Type your username')
        }
    }
    stages {
      stage('build') {
         agent { 
        docker { image 'python:3.7.12' } 
      }
        }
        steps {
          sh '''
              python3 -m venv .venv
              . .venv/bin/activate
              pip3 install -r requirements.txt
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
          echo 'Approved by: ${username}'
          '''
        }   
      }
  }
  
