pipeline {
    agent any
  
    parameters
    {
        booleanParam(defaultValue: true, description: '', name: 'sign_check')
        string(name: 'name', defaultValue: "Prod-Env", description: 'env')
    }
    
    stages {
        
        stage ('Stage-Env') {
            steps {
                script {
                    
                    if (params.name == "Stage-Env" ||  params.name == "Stage-Env"){
                    if (params.sign_check == true) {
                       sh 'cd /var/lib/jenkins/workspace/Brief13/staging-env'
                    }
                    }
               }                
            }
        }
        
        stage ('Prod-Env') {
            steps {
                script {
                    
                    if (params.name == "Prod-Env" ||  params.name == "Prod-Env"){
                    if (params.sign_check == true)  {
                        sh 'cd /var/lib/jenkins/workspace/Brief13/prod-env'
                    }
                    }
                }                
            }
        }
        
        stage ('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }                
            }
        }
    
        stage ('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan'
                }
            }
        }

        stage ('Terraform apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve' 
                }    
            }
        } 
    }    
}
