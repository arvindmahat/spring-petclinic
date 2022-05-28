pipeline {
    agent { label 'build_java_11' }
    triggers {
        cron('0 * * * *')
    }
    stages {
        stage('SourceCode') {
            steps {
                git branch: 'declarative', url: 'https://github.com/spring-projects/spring-petclinic.git'
            }
        }
        stage('Build & SonarQube analysis') {
            steps {
              withSonarQubeEnv('sonar') {
                sh 'mvn clean package sonar:sonar'
              }
            }
        }
        stage('archiveArtifacts and test results') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false
                junit '**/surefire-reports/*.xml'
            }
        }
        stage("Quality Gate") {
            steps {
              timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: true
              }
            }
        }
    }
}