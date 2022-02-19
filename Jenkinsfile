
node{
     
    stage('SCM Checkout'){
        git  url:  'https://github.com/saikumarkaleru/majorproject_final.git',branch: 'main'
    }
    
   
    stage('Build Docker Image'){
       
        sh 'sudo chmod -R 777 ./docker_images.sh'
        sh './docker_images.sh'
        
    }
    

    
}