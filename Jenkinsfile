pipeline {
  agent { docker { image 'python:3.7.12' } }
  stages {
    stage('build') {
      steps {
        sh '''
            python3 -m venv .venv
            . .venv/bin/activate
            pip3 intall -r requirements.txt
            pytest -v
        '''
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
