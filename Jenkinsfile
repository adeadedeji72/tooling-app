pipeline {
    agent any

    stages {

        stage("Build Docker Image") {
            steps {
                sh 'docker build -t bayo72/bayo_devops:'+env.BRANCH_NAME+'-0.2 .'
            }
        }
        stage("Login to Dockerhub") {
            steps {
                withCredentials([string(credentialsId: 'hub_secret', variable: 'sec_docker')]) {
                sh 'docker login -u bayo72 -p ${dockerhub_secret}' }
            }

        }
        stage("Push Image to Dockerhub") {
            steps {
                sh 'docker push bayo72/bayo_devops:'+env.BRANCH_NAME+'-0.2'
            }
        }
    }

}