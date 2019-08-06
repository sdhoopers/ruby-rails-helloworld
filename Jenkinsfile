pipeline {
    agent { dockerfile true }
    stages {
        stage('list files') {
            steps {
                sh 'ls -l'
            }
        }
        stage('Test') {
            steps {
                sh 'java -version'
                sh 'ruby -v'
            }
        }
    }
}
