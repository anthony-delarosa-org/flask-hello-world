pipeline {
  agent { docker { image 'python:3.7.12' } }
  stages {
    stage('build') {
      steps {
        sh 'pip3 install -r requirements.txt --user'
      }
    }
    stage('test') {
      steps {
        sh 'python3 test.py'
      }   
    }
    stage('deploy') {
      steps {
        sh 'python3 app.py'
      }   
    }
  }
}
