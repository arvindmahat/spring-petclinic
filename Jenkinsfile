pipeline {
    agent any
    environment {
        registry = "docker1196/myspc"
        registryCredential = "Dockerhub_id"
        dockerImage = ''
    }
    stages {
        stage('scm') {
            steps {
                git branch: 'main', url: 'https://github.com/arvindmahat/spring-petclinic.git'
            }
        }
        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build registry 
                }
            }
        }
        stage('push our image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push() 
                    }
                }
            }
        }
        stage('Deploy App') {
            steps {
                script {
                kubernetesDeploy(configs: "spc.yaml", kubeconfigId: "k8s_con")
                }
            }
        }
    }
}
