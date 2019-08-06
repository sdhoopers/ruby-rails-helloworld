pipeline {
    agent { dockerfile true }
    stages {
        stage('Setup') {
            steps {
                sh 'java -version'
                sh 'ruby -v'
                sh "echo JAVA_HOME: $JAVA_HOME"
            }
        }
        stage('Build') {
            steps {
                sh 'bundle install'
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

        stage('static security scan') {
            steps {
                sh "echo Install brakeman for SAST scanning"
                sh 'gem install brakeman --no-ri --no-rdoc'
                sh "echo Run brakeman"
                sh 'brakeman -o brakeman-output.json --no-progress --no-exit-on-warn' 
                publishBrakeman 'brakeman-output.json'
            }   
        }
    }
}
