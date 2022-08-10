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
               args '-u root'
           }
         }
         steps {
            sh 'dotnet publish -c release -o /core --no-restore'
         }
      }
  }
}
