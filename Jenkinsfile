pipeline {
  agent any
  environment {
    AWS_ACCESSOBJ = credentials('AWS_ACCESS_KEY')
    AWS_SECRETOBJ = credentials('AWS_SECRET_KEY')
  }
  stages {
    stage('Create and Publish AMI') {
      steps {
        script {
          env.AWS_ACCESS_KEY = "${AWS_ACCESSOBJ_PSW}"
          env.AWS_SECRET_KEY = "${AWS_SECRETOBJ_PSW}"
          sh "packer init DevOps-Project/aws-ami-v1.pkr.hcl"
          sh "packer build DevOps-Project/aws-ami-v1.pkr.hcl"
        }
      }
    }
  }
}
