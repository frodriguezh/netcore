pipeline {
  agent any 
  environment {
    CI = true
    ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory-access-token')
  }
  stages{
       stage('Build') {
         agent {
           dockerfile true
         }
         steps {
            echo 'fin'
         }
      }
  }
}
