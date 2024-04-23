pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'oskara-helloworld:latest'
        GIT_REPO = 'https://github.com/sillkongen/oskara-helloworld.git'
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    // Checking out the code and capturing the commit hash
                    def scmVars = git branch: 'main', url: "${env.GIT_REPO}"
                    // Defining GIT_COMMIT as an environment variable, sanitizing to only keep alphanumeric and replacing uppercase with lowercase
                    env.GIT_COMMIT = scmVars.GIT_COMMIT.take(7).toLowerCase().findAll(/[a-z0-9]/).join('')
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build a Docker image from the Dockerfile in the root directory of the repository
                    // Tagging it with the sanitized Git commit hash
                    docker.build("${env.DOCKER_IMAGE}:${env.GIT_COMMIT}")
                }
            }
        }
    }
}
