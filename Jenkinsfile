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
            //echo "jf rt u --url http://192.168.0.12:8081/artifactory --access-token ${ARTIFACTORY_ACCESS_TOKEN} Artifact_$BUILD_NUMBER ${myVariable}/"
            sh 'jf rt u --url http://192.168.0.10:8081/artifactory --access-token ${ARTIFACTORY_ACCESS_TOKEN} Artifact_$BUILD_NUMBER result/'
            //sh 'jf rt u --url https://45ac-2800-150-137-798-9ebc-54e7-dce5-6060.sa.ngrok.io/ --access-token ${ARTIFACTORY_ACCESS_TOKEN} app_75.zip example-repo-local/'
            //Subir directorio
            //sh 'jf rt u --url http://192.168.0.12:8081/artifactory --access-token ${ARTIFACTORY_ACCESS_TOKEN} $WORKSPACE/Artifact_$BUILD_NUMBER ${ARTIFACTORY_FOLDER}/'
          }
        }
  }
}
