pipeline {
  agent any 
  environment {
    CI = true
    ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory-access-token')
  }
  stages{
   stage('Build') {
       steps {
         script {
          dir("test")
            {
             sh  'touch $WORKSPACE/Artifact_$BUILD_NUMBER'
            }
            }
          }
        }
        stage('Upload to Artifactory') {
          steps {
            //Subir un archivo especifico
            sh 'jf rt u --url http://192.168.0.12:8081/artifactory --access-token ${ARTIFACTORY_ACCESS_TOKEN} Artifact_$BUILD_NUMBER result/'
            //Subir directorio
            //sh 'jf rt u --url http://192.168.0.12:8081/artifactory --access-token ${ARTIFACTORY_ACCESS_TOKEN} $WORKSPACE/Artifact_$BUILD_NUMBER java-web-app/'
          }
        }
  }
}
