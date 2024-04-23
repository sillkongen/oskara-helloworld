pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'oskara-helloworld:latest'
        GIT_REPO = 'https://github.com/sillkongen/oskara-helloworld.git'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Set a longer timeout for the Git operation (e.g., 20 minutes)
                git branch: 'main',
                    url: "${env.GIT_REPO}",
                    timeout: [time: 20, unit: 'MINUTES']
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${env.DOCKER_IMAGE}")
                }
            }
        }
    }
}
