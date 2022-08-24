pipeline {
  agent any
  //Timeout 5 minutes
  options {
      timeout(time: 5, unit: 'MINUTES') 
  }
  environment {
    ECR_IMAGE_URL = "796126936196.dkr.ecr.us-east-1.amazonaws.com/frodriguezh:latest"
    AWS_ECR_REGION = "us-east-1"
    AWS_ACCOUNT_ID = "aws"
    
  }
  stages {
    stage('CLear Workspace') {
        steps {
            cleanWs()
        }
    }
    
    stage('Pulling Image from ECR') {
        steps {
        
            script {
                docker.withRegistry("https://" + "${ECR_IMAGE_URL}", "ecr:${AWS_ECR_REGION}:${AWS_ACCOUNT_ID}") {
                    sh "docker pull ${ECR_IMAGE_URL}"
              }
            }
        }
    }
    stage('Building image') {
        agent {
            
            docker { 
                
                image '796126936196.dkr.ecr.us-east-1.amazonaws.com/frodriguezh:latest' 
                args '-u root' 
                
            }
        }
        stages {
            
            stage('Check Dependencies') {
                steps {
                    
                    sh "git --version"
                    sh "sonar-scanner -v"
                    sh "zip -v"
                    sh "jf --version"
                    sh "ssh -V"
                    sh "aws --version"
                }    
            }
        }
      }
  }
}
