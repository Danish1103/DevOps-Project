pipeline {
  agent any
  /* tools {
    maven 'Maven-3.9.1'
    jdk 'open-jdk17'
  } */
  environment {
   // AWS_ACCESSOBJ = credentials('AWS_SECRET_KEY_ID')
    // AWS_SECRETOBJ = credentials('AWS_SECRET_ACCESS_KEY')
    SONAR_CLOUDOBJ = credentials('SONAR_TOKEN')
  }
  stages {
    /* Stage 1 - Create and Publish AMI
    stage('Part 1 - Create and Publish AMI') {
      steps {
        script {
          env.AWS_ACCESS_KEY_ID = credentials('AWS_SECRET_KEY_ID')
          env.AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
          sh 'packer init Part1/aws-ubuntu.pkr.hcl'
          sh 'packer build Part1/aws-ubuntu.pkr.hcl'
        }
      }
    }
    */

    // Stage 2 - Scan Repo with SonarCloud
    stage('Part 2 - Scan Repo with SonarCloud') {
      steps {
        script {
          dir("Part-2") {
            env.SONAR_TOKEN = credentials('SONAR_TOKEN')
            run 'mvn -B verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -D sonar.projectKey=Danish1103_DevOps-Project'
          }
        }
      }
    }
  }
}
stage('Part 2 - Maven Comple and Build Artifact') {
      steps {
        script {
          dir("Part-2") {
             bat "mvn clean"
              bat "mvn compile"
               bat "mvn package"
          }
        }
      }
    }
