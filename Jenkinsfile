pipeline {
  agent any

  environment {
     //AWS_ACCESSOBJ = credentials('AWS_SECRET_KEY_ID')
    //AWS_SECRETOBJ = credentials('AWS_SECRET_ACCESS_KEY')
    SONAR_CLOUDOBJ = credentials('SONAR_TOKEN')
  }

  /*stages {
    stage('Part 1 - Create and Publish AMI') {
      steps {
        script {
          withCredentials([string(credentialsId: 'AWS_SECRET_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
            sh 'packer init Part1/aws-ubuntu.pkr.hcl'
            sh 'packer build Part1/aws-ubuntu.pkr.hcl'
          }
        }
      }
    }
*/
    stage('Part 2 - Scan Repo with SonarCloud') {
      steps {
        script {
          withCredentials([string(credentialsId: 'SONAR_TOKEN', variable: 'SONAR_TOKEN')]) {
            dir("Part-2") {
              sh 'mvn -B verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=Danish1103_DevOps-Project'
            }
          }
        }
      }
    }

    stage('Part 2 - Maven Compile and Build Artifact') {
      steps {
        script {
          dir("Part-2") {
            bat 'mvn clean'
            bat 'mvn compile'
            bat 'mvn package'
          }
        }
      }
    }
  }
}
