
Jenkinsfile (Declarative Pipeline)

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
              echo 'Building..'
              sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'ng test'
            }
        }
        stage('e2e') {
            steps {
                sh 'docker build -t cs6261project4:testimage .'
                sh 'docker run -it -d --name testcontainer -p 4200:8080 cs6261project4:testimage -v /app'
                sh './node_modules/protractor/bin/webdriver-manager update'
                sh 'ng e2e --devServerTarget=8080'
                sh 'docker rm testcontainer || true'

            }
        }
        stage('Deploy') {
            steps {
                echo 'Not yet implemented'
            }
        }
    }
}
