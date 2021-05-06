node {
stage ('SCM Checkout' ) {
git credentialsId: 'git-creds', url: 'https://github.com/johnsoncls2019/spring_project.git'
}
stage ('Build Docker image') {
sh "docker build -t johnsoncls2019/demo ."
}
stage ('Push docker image') {
withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
sh "docker login -u johnsoncls2019 -p ${dockerHubPwd}"
}
sh 'docker push johnsoncls2019/demo'
}
stage ('Run container on Dev server') { 
def dockerRun = 'docker-run -p 8080:8080 -d --name AchiStar Technologies johnsoncls2019/demo'
sshagent(['dev-server']) {
sh "ssh -o StrictHostkeyChecking=no root@192.168.44.169 ${dockerRun}"
}
}
}
