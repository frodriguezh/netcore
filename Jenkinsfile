pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh "cp /app ${WORKSPACE}"
            }
        }
    }
}
