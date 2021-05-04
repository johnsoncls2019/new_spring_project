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
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'johnsoncls2019', passwordVariable: 'Cdrespxy1', usernameVariable: 'johnsoncls2019')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push johnsoncls2019/demo:latest'
        }
      }
    }
  }
}

