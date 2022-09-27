pipeline {
    agent any

    stages {

        stage("Build Docker Image") {
            steps {
                sh 'docker build -t bayo72/bayo_devops:'+env.BRANCH_NAME+'-0.1 .'
            }
        }
        stage("Login to Dockerhub") {
            steps {
                withCredentials([string(credentialsId: 'dockerhub_PWD', variable: 'dockerhub_pwd')]) {
                sh 'docker login -u bayo72 -p ${dockerhub_pwd}' }
            }

        }
        stage("Push Image to Dockerhub") {
            steps {
                sh 'docker push bayo72/bayo_devops:'+env.BRANCH_NAME+'-0.1'
        stage("deploy") {
            steps {
                echo 'this is the deployment stage'
                echo 'added to dev branch'
                echo 'hello!'
            }
        }
    }
}

}

}