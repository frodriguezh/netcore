pipeline {
  agent any 
  environment {
    CI = true
    ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory-access-token')
  }
  stages{
    stage('Build') {
       steps {
            echo 'final'
       }
    }
    stage ('Removing files') {
        steps {
            sh 'rm -rf $WORKSPACE/*'
        }
    }
  }
}
