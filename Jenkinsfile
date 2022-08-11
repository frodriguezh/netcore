pipeline {
    agent none
    environment {
        CI = true
        ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory-access-token')
    }
    stages {
        stage('Build') {
            agent {
                dockerfile { filename 'Dockerfile' }
            }
            steps {
                sh "cp -R /app ${WORKSPACE}"
            }
        }
        stage('Upload to Artifactory') { 
            agent any
            steps {
                sh 'jf rt u --url http://192.168.0.12:8081/artifactory --access-token ${ARTIFACTORY_ACCESS_TOKEN} app/ result/'
            }
        }
        stage ('Removing files') {
            agent any
            steps {
                sh 'rm -rf $WORKSPACE/*'
            }
        }
    }
}
