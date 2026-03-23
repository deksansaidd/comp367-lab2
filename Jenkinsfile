pipeline {
    agent any
    tools {
        maven "MAVEN3"
    }
    environment {
        DOCKERHUB_PWD = credentials('CredentialID_DockerHubPWD')
    }
    stages {
        stage("Check out") {
            steps {
                git branch: 'main', url: 'https://github.com/deksansaidd/comp367-lab2'
            }
        }
        stage("Build maven project") {
            steps {
                sh 'mvn clean install'
            }
        }
        stage("Docker build") {
            steps {
                script {
                    sh 'docker build -t deksansaidd/myapp:1.0 .'
                }
            }
        }
        stage("Docker login") {
            steps {
                script {
                    sh 'docker login -u deksansaidd -p ${DOCKERHUB_PWD}'
                }
            }
        }
        stage("Docker push") {
            steps {
                script {
                    sh 'docker push deksansaidd/myapp:1.0'
                }
            }
        }
    }
}
