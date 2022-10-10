pipeline {
    agent any
    stages {
        stage('Git checkout') {
           steps{
                git branch: 'main', credentialsId: 'orahub', url: 'https://orahub.oci.oraclecorp.com/oit-eng-monitoring-and-logging/oci-metric-templates'
            }
        }
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform plan') {
            steps{
                sh 'terraform plan'
            }
        }
        stage('terraform apply') {
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }


}
