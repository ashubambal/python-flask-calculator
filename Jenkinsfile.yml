pipeline {
    agent any
    stages {
        stage("Clone Code") {
            steps {
                echo "Clone Code"
                git url: "https://github.com/ashubambal/python-flask-calculator.git", branch: "dev"// Git checkout step
            }
        }
        stage("Build & test") {
            steps {
                echo "Build Code"
                sh "docker build -t jenkins-python-flask-calculator ."
            }
        }
        stage("Push image on docker hub") {
            steps {
                echo "Pushing imahge on docker hub"
                    withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                        sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                        sh "docker tag jenkins-python-flask-calculator ${env.dockerHubUser}/jenkins-python-flask-calculator:latest"
                        sh "docker push ${env.dockerHubUser}/jenkins-python-flask-calculator:latest "
                    }
            }
        }
        stage("Deploy") {
            steps {
                echo "Deploy to Production"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
