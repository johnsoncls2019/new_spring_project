#!groovy

pipeline {

  agent none
environment {
registry = "johnsoncls2019/spring-project"
registryCredential = 'DockerHub'
dockerImage = ''
} 
 stages {
    stage('Docker Build') {
      agent any
      steps {
	dockerImage = docker.build registry + ":$BUILD_NUMBER"
      }
    }
        stage('Docker Test'){
            steps {
                echo 'Testing...' 
            }
        }
stage('Deploy our image') {
steps{
script {
docker.withRegistry( '', registryCredential ) {
dockerImage.push()          
        }
      }
    }
  }
}
}
