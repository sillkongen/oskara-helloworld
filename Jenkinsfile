pipeline {
    agent any

    environment {
        // Define the Docker image name and tag
        DOCKER_IMAGE = 'oskara-helloworld:latest'
        // GitHub repository URL
        GIT_REPO = 'https://github.com/sillkongen/oskara-helloworld.git'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Check out the latest code from the specified GitHub repository
                git GIT_REPO
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build a Docker image from the Dockerfile in the root directory of the repository
                    docker.build("${env.DOCKER_IMAGE}")
                }
            }
        }
    }
}
