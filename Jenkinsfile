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
          echo 'hello word'
       }
    }
    stage('Docker Build & Push') {
      
      echo 'Docker Build & Push
    }
  }
}
