pipeline {
  agent any 
  environment {
    CI = true
    ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory-access-token')
  }
  stages{
   stage('Build') {
     steps {
       
    }
    stage('Upload to Artifactory') {
      steps {
        //Subir un archivo especifico
        //echo "jf rt u --url http://192.168.0.12:8081/artifactory --access-token ${ARTIFACTORY_ACCESS_TOKEN} Artifact_$BUILD_NUMBER ${myVariable}/"
        sh 'jf rt u --url http://192.168.0.12:8081/artifactory --access-token ${ARTIFACTORY_ACCESS_TOKEN} Artifact_$BUILD_NUMBER result/'
        //Subir directorio
        //sh 'jf rt u --url http://192.168.0.12:8081/artifactory --access-token ${ARTIFACTORY_ACCESS_TOKEN} $WORKSPACE/Artifact_$BUILD_NUMBER ${ARTIFACTORY_FOLDER}/'
      }
    }
  }
}
