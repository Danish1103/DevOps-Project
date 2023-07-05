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
          bat "packer init aws-ami-v1.pkr.hcl"
          bat "packer build aws-ami-v1.pkr.hcl"
        }
      }
    }
  }
}
