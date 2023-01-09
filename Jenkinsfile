pipeline {
    agent any
    stages {
    stage('检出') {
        steps {
        checkout([
            $class: 'GitSCM',
            branches: [[name: GIT_BUILD_REF]],
            userRemoteConfigs: [[
            url: GIT_REPO_URL,
            credentialsId: CREDENTIALS_ID
            ]]])
        }
        }

        stage('docker build') {
        steps {
            sh 'docker build -t bytepoweredgo/rust-builder:latest .'
            sh 'docker tag bytepoweredgo/rust-builder:latest bytepoweredgo/rust-builder:${IMAGE_VERSION}'
        }
        }

        stage('docker push') {
        steps {
            withCredentials([usernamePassword(
            credentialsId: "$DOCKER_HUB_SECRETS",
            usernameVariable: 'USERNAME',
            passwordVariable: 'PASSWORD')]) {
                sh 'docker login -u$USERNAME -p$PASSWORD'
                sh 'docker push bytepoweredgo/rust-builder:latest'
                sh 'docker push bytepoweredgo/rust-builder:${IMAGE_VERSION}'
            }

            }
        }
    }
    environment {
        IMAGE_VERSION = '1.66.0-slim-buster'
    }
}