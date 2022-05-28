pipeline {
    agent { label 'build_java_11' }
    stages {
        stage ('Clone') {
            steps {
                git branch: 'declarative', url: "https://github.com/arvindmahat/spring-petclinic.git"
            }
        }
        stage('Build & SonarQube analysis') {
            steps {
              withSonarQubeEnv('sonar') {
                sh 'mvn clean package sonar:sonar'
              }
            }
        }
        
        stage('Artifactory-Configuration') {
            steps {
                rtMavenDeployer (
                    id: 'spc-deployer',
                    serverId: 'Jfrog_Instance',
                    releaseRepo: 'spc-libs-release-local',
                    snapshotRepo: 'spc-libs-snapshot-local',

                )
            }
        }
        stage('Build the Code and sonarqube-analysis') {
            steps {
                rtMavenRun (
                    tool: 'M2_HOME',
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: 'spc-deployer',
                )
            }
        }
        stage ('Publish build info') {
            steps {
                rtPublishBuildInfo (
                    serverId: "Jfrog_Instance"
                )
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