

pipeline {
    agent any
    stages {
     
        stage('SCM Checkout'){
            steps{
                    git  url:  'https://github.com/saikumarkaleru/majorproject_final.git',branch: 'main'
            }
        }
        stage('Build Docker Image -1'){
            steps{
                sh 'sudo chmod -R 777 ./docker_images.sh'
                sh './docker_images.sh'
            }
        }
    }

}

