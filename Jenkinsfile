pipeline {
    agent none
    parameters{
        choice(choices: ['dev', 'stage', 'prod'], description: 'Name of the Environment', name: 'ENV')
        string(defaultValue: "aws account id", description: 'Please paste your AWS Account ID', name: 'AWS_ACCOUNT_ID')
        string(defaultValue: "aws access key id", description: 'Please paste your AWS Access Key Id', name: 'AWS_ACCESS_KEY_ID')
        string(defaultValue: "aws secret access key", description: 'Please paste your AWS Secret Access Key', name: 'AWS_SECRET_ACCESS_KEY')
        string(defaultValue: "aws session token", description: 'Please paste your AWS Session Token', name: 'AWS_SESSION_TOKEN')
        string(defaultValue: "aws ecr repo name", description: 'Please type ECR Repo Name', name: 'AWS_ECR_REPO_NAME')
        string(defaultValue: "aws ecr image tag", description: 'Please type ECR Repo Name', name: 'AWS_ECR_IMAGE_TAG')
        choice(choices: ['us-west-2', 'ca-central-1','us-east-1'], description: 'What AWS Region?', name: 'AWS_REGION')
        string(defaultValue: "username", description: 'Please type your username', name: 'USERNAME')
    }
    
    stages {
    
       stage('Log into AWS ECR') {
          agent any
          steps {
             script {
             sh '''
                aws ecr get-login-password — region ${AWS_REGION} | docker login — username AWS — password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com
             '''
           }
         }
       }
       
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
            '''
          }
        } 
       
       stage('Building image') {
          agent any
          steps {
             script {
             dockerImage = docker.build "${AWS_ECR_REPO_NAME}:${AWS_ECR_IMAGE_TAG}" 
           }
         }
       }
       stage('deploy') {
           agent any
           steps {
             sh '''
                 echo Deployed and Approved by: ${USERNAME}
             '''
        }
    }
  } 
}
