pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Add your build commands here
                sh 'echo "Build step executed"'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Add your test commands here
                sh 'echo "Test step executed"'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
        }
    }
}