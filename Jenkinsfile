node {
stage ('SCM Checkout' ) {
git credentialsId: 'git-creds', url: 'https://github.com/johnsoncls2019/spring_project.git'
}
stage ('Mvn package') {
def mvnHome = tool name: 'LocalMaven 3.8', type: 'maven'
def mvnCMD = "${mvnHome}/usr/bin/mvn"
sh " mvn clean package"
}
stage ('Build Docker image') {
sh "docker build -t springboot ."
}
stage ('Push docker image') {
withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
sh "docker login -u johnsoncls2019 -p ${dockerHubPwd}"
}
sh 'docker push johnsoncls2019/springboot'
}
stage ('Run container on Dev server') { 
def dockerRun = 'docker run -p 5000:5000 -d  -t --name AchiStarTechnologies1 johnsoncls2019/springboot'
def dockerRemove = 'docker rm --force AchiStarTechnologies1'
sshagent(['dev-server']) {
sh "ssh -o StrictHostKeyChecking=no root@192.168.44.129 ${dockerRemove}"
sh "ssh -o StrictHostKeyChecking=no root@192.168.44.129 ${dockerRun}" 
}
}
}
