pipeline {
    agent any
    stages {
        stage('Build image') {
            /* This builds the actual image; synonymous to
             * docker build on the command line */
            steps {
                script {
                    app = docker.build("fmacke200/coursework2")
                }
            }
        }

        stage('Test image') {
            environment {
                scannerHome = tool 'SonarQube'
            }

            steps {
                withSonarQubeEnv('sonarqube') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }

        stage('Push image') {
            /* Finally, we'll push the image with two tags:
             * First, the incremental build number from Jenkins
             * Second, the 'latest' tag.
             * Pushing multiple tags is cheap, as all the layers are reused. */
            steps{
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    }
}
