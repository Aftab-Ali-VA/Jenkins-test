pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo "Checking out code..."
                checkout scm
            }
        }

        stage('Build Inside Container') {
            agent {
                dockerfile {
                    filename 'Dockerfile.build'
                    // Manual workspace mounting - declarative syntax
                    args "-v ${env.WORKSPACE}:/workspace -w /workspace"
                    reuseNode true
                }
            }
            steps {
                echo "Building with Makefile inside custom Docker container..."
                sh 'pwd'
                sh 'ls -la'
                sh 'make clean'
                sh 'make all'
                sh 'ls -la build/'
            }
        }

        stage('Archive Artifact') {
            steps {
                echo "Archiving artifacts..."
                echo "Current workspace: ${env.WORKSPACE}"
                sh 'ls -la build/'
                archiveArtifacts artifacts: 'build/hello', fingerprint: true
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
