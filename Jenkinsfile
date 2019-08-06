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
                sh 'bundle audit update'
                dependencyCheck additionalArguments: '', odcInstallation: 'depcheck521'

                sh "echo Listing all files after build"
                sh "ls -ltra"
                
                sh "echo Publish results of the dependency check scan"
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }

    }
}
