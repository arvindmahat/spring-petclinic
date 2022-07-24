pipeline {
    agent any
    environment {
        registry = "docker1196/spc"
        registryCredential = 'Dockerhub_id'
        dockerImage = 'spc'
    }
    tools {
        maven 'MVN_version'
    }
    stages {
        stage('scm') {
            steps {
                git branch: 'main', url: 'https://github.com/arvindmahat/spring-petclinic.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package '
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
        },
        stage('Deploy App') {
            steps {
                script {
                kubernetesDeploy(configs: "hspc.yaml", kubeconfigId: "K8_key")
                }
            }
        }
    }
}
