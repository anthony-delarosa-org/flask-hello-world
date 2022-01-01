pipeline {
  agent { docker { image 'python:3.7.12' } }
  stages {
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
            docker container run -d -p 5000:5000 --name flask-hello-world python:3.7.12
            docker container exec -ti flask-hello-world pyton3 app.py
        '''
      }   
    }
  }
}
