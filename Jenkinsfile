pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'rmassey95/repo_4_integration:1.0'
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials'
    }

    stages {

        // a. Checkout Stage
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        // b. Build Maven Project Stage
        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        // d. Docker Login Stage
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKER_CREDENTIALS_ID}",
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                }
            }
        }

        // e. Docker Build Stage
        stage('Docker Build') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        // f. Docker Push Stage
        stage('Docker Push') {
            steps {
                sh "docker push ${DOCKER_IMAGE}"
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
