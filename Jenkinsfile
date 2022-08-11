pipeline {
  agent any 
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
            sh 'date > /tmp/test.txt'
            sh "cp /tmp/test.txt ${WORKSPACE}"
            archiveArtifacts 'test.txt'
            
       }
    }
    stage ('Removing files') {
        steps {
            //sh 'rm -rf $WORKSPACE/*'
            echo 'final'
        }
    }
  }
}
