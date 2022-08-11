pipeline {
    agent { dockerfile true }
    environment {
        CI = true
        ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory-access-token')
    }
    stages {
        stage('Build') {
            steps {
                sh "cp -R /app ${WORKSPACE}"
            }
        }
        stage('Upload to Artifactory') {
            agent any { 
                steps {
                    sh  'touch $WORKSPACE/Artifact_$BUILD_NUMBER'
                    sh 'jf rt u --url http://192.168.0.12:8081/artifactory --access-token ${ARTIFACTORY_ACCESS_TOKEN} Artifact_$BUILD_NUMBER result/'
                }
            }
        }
    }
}
