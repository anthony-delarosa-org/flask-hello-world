pipeline {
  agent { docker { image 'python:3.7.12' } }
  stages {
    stage('build') {
      steps {
        sh '''
            python3 -m venv .venv
            . .venv/bin/activate
            sudo pip3 install -r requirements.txt
        '''
      }
    }
    stage('test') {
      steps {
        sh 'sudo python3 test.py'
      }   
    }
    stage('deploy') {
      steps {
        sh 'sudo python3 app.py'
      }   
    }
  }
}
