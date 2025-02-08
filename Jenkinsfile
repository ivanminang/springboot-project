

pipeline {
    agent any
    environment {
        // DOCKERHUB_CREDENTIALS = dockerhub-credentials('dockerhub')
        IMAGE_TAG = "V1.0.${BUILD_NUMBER}"  // Set the image tag as an environment variable
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '20'))
        disableConcurrentBuilds()
        timeout(time: 60, unit: 'MINUTES')
        timestamps()
    }
    stages {
        stage('Testing') {
            agent {
                docker { image 'maven:3.8.4-eclipse-temurin-17-alpine' }
            }
            steps {
                sh '''
                // cd springboot
                mvn test
                '''
            }
        }

        stage('SonarQube Analysis') {
            agent {
                docker { image 'sonarsource/sonar-scanner-cli:5.0.1' }
            }
            environment {
                CI = 'true'
                scannerHome = '/opt/sonar-scanner'
            }
            steps {
                withSonarQubeEnv('sonar') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }


        stage('Login') {
            steps {
                // Securely access DockerHub credentials
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_CREDENTIALS_USR', passwordVariable: 'DOCKERHUB_CREDENTIALS_PSW')]) {
                    // Login to DockerHub using the credentials
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                }
            }
        }

        // stage('Login') {
        //     steps {
        //         sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        //     }
        // }

            stage('Build and Push Image') {
                steps {
                    sh """
                    cd ${WORKSPACE}/springboot
                    docker build -t ivanminang/springboot:${IMAGE_TAG} .
                    docker push ivanminang/springboot:${IMAGE_TAG}
                    """
                }
            }

        // stage('Update Image Tag in Helm Repo for ArgoCD') {
        //     steps {
        //         sh """
        //         rm -rf jambalaya || true
        //         git clone git@github.com:Djurizt/jambalaya.git
        //         cd ${WORKSPACE}/jambalaya/demo-project
        //         sed -i 's/tag:.*/tag: ${IMAGE_TAG}/' ./chart/values.yaml
        //         git config user.email "gbebejunior@gmail.com"
        //         git config user.name "Djurizt"
        //         git add ./chart/values.yaml
        //         git commit -m "Update image tag to ${IMAGE_TAG}"
        //         git push origin main
        //         """
        //     }
        // }
    }
    post {
        success {
            echo "Image built, pushed, and ArgoCD will automatically deploy the new version."
        }
        failure {
            echo "Deployment failed!"
        }
    }
}