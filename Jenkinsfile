pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'oskara-helloworld'
        GIT_REPO = 'https://github.com/sillkongen/oskara-helloworld.git'
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    // Checking out the code and capturing the commit hash
                    def scmVars = git branch: 'main', url: "${env.GIT_REPO}"
                    // Sanitizing GIT_COMMIT to ensure it's a valid Docker tag part
                    env.GIT_COMMIT = scmVars.GIT_COMMIT.take(7).toLowerCase().findAll(/[a-z0-9]/).join('')
                    echo "Sanitized GIT_COMMIT: ${env.GIT_COMMIT}" // Logging for debugging
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build a Docker image from the Dockerfile in the root directory of the repository
                    // Tagging it with the sanitized Git commit hash
                    def dockerTag = "${env.DOCKER_IMAGE}:${env.GIT_COMMIT}"
                    echo "Building Docker image with tag: ${dockerTag}" // Logging for debugging
                    docker.build(dockerTag)
                }
            }
        }
    }
}
