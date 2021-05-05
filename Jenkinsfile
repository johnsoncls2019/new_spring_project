#!groovy

pipeline {

  agent none
environment {
registry = "johnsoncls2019/spring-project"
registryCredential = 'docker-hub-credentials' 
dockerImage = ''
} 
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

stage('Push image') {
agent {
    label 'pi'
}
steps {
  sh 'docker login -u johnsoncls2019 -p Cdrespxy1'
  sh 'docker pull johnsoncls2019/image:version || (docker build -f dockerfile -t johnsoncls2019/image:version && docker push my-johnsoncls2019/image:version)'
}
