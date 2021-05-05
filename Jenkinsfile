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
steps {
/* Finally, we'll push the image with two tags:
* First, the incremental build number from Jenkins
* Second, the 'latest' tag. */
withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'johnsoncls2019', passwordVariable: 'Cdrespxy1')]) {
docker.withRegistry('', 'docker-hub-credentials') {
sh "docker login -u ${USERNAME} -p ${PASSWORD}"
myImage.push("${env.BUILD_NUMBER}")
myImage.push("latest")
}
}
}
}
}
}
