pipeline {
  agent any
  tools {
    maven 'Maven-3.9.1'
    jdk 'open-jdk17'
  }
  environment {
    AWS_ACCESSOBJ = credentials('AWS_SECRET_KEY_ID')
    AWS_SECRETOBJ = credentials('AWS_SECRET_ACCESS_KEY')
    SONAR_CLOUDOBJ = credentials('SONAR_TOKEN')
  }
  stages {
    // stage('Part 1 - Create and Publish AMI') {
    //   steps {
    //     script {
    //       env.AWS_ACCESS_KEY_ID = "${AWS_ACCESSOBJ_PSW}"
    //       env.AWS_SECRET_ACCESS_KEY = "${AWS_SECRETOBJ_PSW}"
    //       sh ""
    //       sh "packer init Part1/aws-ubuntu.pkr.hcl"
    //       sh "packer build Part1/aws-ubuntu.pkr.hcl"
    //     }
    //   }
    // }

    stage('Part 2 - Scan Repo with SonarCloud') {
      steps {
        script {
          dir("Part2") {
            env.SONAR_TOKEN = "${SONAR_CLOUDOBJ_PSW}"
            // sh "mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -D sonar.projectKey=sheenilim08_devops-and-cloud-handson"
            bat "mvn -B verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -D sonar.projectKey=Danish1103_DevOps-Project"
          }
        }
      }
    }
