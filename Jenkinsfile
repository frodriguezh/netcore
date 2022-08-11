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
        
    }
}
