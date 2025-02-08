pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
    stages {
        build('Build') {
            steps {
                echo 'Building..'
            }
        }
    }
}