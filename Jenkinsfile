node {
stage ('SCM Checkout' ) {
git credentialsId: 'git_creds2', url: 'https://github.com/johnsoncls2019/new_spring_project.git'
}
stage ('Mvn package') {
def mvnHome = tool name: 'localMaven', type: 'maven' 
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
stage ('Run Container on AWS Server') {
def dockerRemove = 'docker rm --force AchiStarTechnologies'
def dockerRun = 'docker run -p 5000:5000 -d -t --name AchistarTecnologies1 johnsoncls2019/springboot'
withAWSParameterStore(credentialsId: 'aws_server', regionName: 'us-east-1') {
sh "${dockerRemove}"
sh "${dockerRun}"
}
}
stage ('Run container on Dev server') {
def dockerRun = 'docker run -p 5000:5000 -d  -t --name AchiStarTechnologies1 johnsoncls2019/springboot'
sshagent(['dev-server']) {
sh "ssh -o StrictHostKeyChecking=no root@192.168.44.129 ${dockerRun}"
}
}
}
