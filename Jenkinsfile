pipeline {
  agent none 
  environment {
    CI = true
    ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory-access-token')
  }
  stages{
    stage('Build') {
       agent {
         docker {
             image 'mcr.microsoft.com/dotnet/sdk:6.0'
         }
       }
       steps {
            echo 'final'
       }
    }
    stage ('Removing files') {
      agent any {
        steps {
            sh 'rm -rf $WORKSPACE/*'
        }
      }
    }
  }
}
