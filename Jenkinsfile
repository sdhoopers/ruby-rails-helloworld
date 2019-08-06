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
                sh 'gem install bundler-audit'
                dependencyCheck additionalArguments: '', odcInstallation: 'depcheck521'
            }
        }
    }
}
