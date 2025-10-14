pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Compiling source code...'
                // Insert your specific build commands here, for example:
                // sh 'npm install' or sh 'mvn compile'
            }
        }
        stage('Test') {
            steps {
                echo 'Running unit tests...'
                // Insert your specific test commands here, for example:
                // sh 'npm test' or sh 'mvn test'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}