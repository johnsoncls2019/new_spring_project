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
}
}
