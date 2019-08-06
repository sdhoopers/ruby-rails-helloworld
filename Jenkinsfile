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
                sh "echo JAVA_HOME: $JAVA_HOME"
            }
        }
        stage('Dependency Check') {
            steps {
                dependencyCheck additionalArguments: '', odcInstallation: 'depcheck521'
            }
        }
    }
}
