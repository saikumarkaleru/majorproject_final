pipeline {
  agent any
    stages {
     
        stage('SCM Checkout'){
            steps{
                git  url: 'https://github.com/saikumarkaleru/majorproject_final.git',branch: 'main'
            }
        }
        
        stage('Build Docker Image 3'){
            steps{
                sh 'chmod -R 777 ./docker_images.sh'
                sh './docker_images.sh'
            }   
        }
        stage('Testing code'){
            steps{
                // todo
                sh 'echo Running Testing phase'
            }   
        }
        stage('Continoues Deployment'){
            steps{
                sh 'chmod -R 777 ./kubernetes.sh'
              //  sh 'sudo ./kubernetes.sh'
                sh 'sudo -S su ubuntu -c "./kubernetes.sh" '
            }   
        }
    }

}

