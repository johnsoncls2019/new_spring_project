#!groovy

pipeline {
  agent none
  stages {
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t johnsoncls2019/demo:latest .'
      }
    }
        stage('Docker Test'){
            steps {
                echo 'Testing...' 
            }
        }
stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'Cdrespxy1', usernameVariable: 'johnsoncls2019')]) {
	sh "docker login -u ${johnsoncls2019} -p ${Cdrespxy1}"
          sh 'docker push johnsoncls2019/demo:latest'
        }
      }
    }
  }
}
