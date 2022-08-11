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
                sh "cp -R /app ${WORKSPACE}/app_$BUILD_NUMBER"
            }
        }
        stage('Upload to Artifactory') { 
            agent any
            steps {
                sh 'jf rt u --url http://192.168.0.12:8081/artifactory --access-token ${ARTIFACTORY_ACCESS_TOKEN} app_$BUILD_NUMBER/ result/'
            }
        }
        stage ('Removing files') {
            agent any
            steps {
                echo 'fin'
                //sh 'rm -rf $WORKSPACE/*'
            }
        }
    }
}
