pipeline {
    agent any

    environment {
        AWS_REGION = "eu-west-1"
        TF_WORKDIR = "./"
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Cloning repository..."
                checkout([$class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[url: 'https://github.com/sohaylahossam/devops-project-1.git']]
                ])
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${TF_WORKDIR}") {
                    sh 'terraform init -input=false'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_WORKDIR}") {
                    sh 'terraform plan -out=tfplan -input=false'
                }
            }
        }


/*

        // ✅ APPLY STAGE (ACTIVE)
        stage('Terraform Apply') {
            steps {
                input message: '✅ Do you want to APPLY the Terraform plan?'
                dir("${TF_WORKDIR}") {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
*/
         ✅ DESTROY STAGE (COMMENTED OUT)
        
        stage('Terraform Destroy') {
            steps {
                input message: '⚠️ Do you want to DESTROY all infrastructure?'
                dir("${TF_WORKDIR}") {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
        
    }

    post {
        success {
            echo "✅ Terraform apply completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Check logs."
        }
    }
}
