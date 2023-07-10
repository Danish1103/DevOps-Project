pipeline {
  agent any
  tools {
    maven 'Maven-3.9.1'
  }
  environment {
    // AWS_ACCESSOBJ = credentials('AWS_SECRET_KEY_ID')
    // AWS_SECRETOBJ = credentials('AWS_SECRET_ACCESS_KEY')
    SONAR_CLOUDOBJ = credentials('SONAR_TOKEN')
    // DO_TOKENOBJ = credentials('DO_APITOKEN')
    // POSTGRE_SQL = credentials('PETCLINIC_POSTGRE_ROOT_PASSWORD')
  }
  stages {
    /* stage('Part 1 - Create and Publish AMI') {
      steps {
        script {
          env.AWS_ACCESS_KEY_ID = "${AWS_ACCESSOBJ_PSW}"
          env.AWS_SECRET_ACCESS_KEY = "${AWS_SECRETOBJ_PSW}"
          sh ""
          sh "packer init Part1/aws-ubuntu.pkr.hcl"
          sh "packer build Part1/aws-ubuntu.pkr.hcl"
        }
      }
    } */

    stage ('Sonarcloud scan') {
            steps {
                script {
                    echo 'scanning code'
                    env.SONAR_TOKEN = "${SONAR_CLOUDOBJ}"
                    bat "mvn --version"
                    bat "mvn verify sonar:sonar"
                    // bat "mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=Danish1103_DevOps-Project"
                }
            }  
        }

    /* stage('Part 2 - Scan Repo with SonarCloud') {
      steps {
        script {
          dir("Part-2") {
           // env.POSTGRE_SQL_PASSWORD = "${POSTGRE_SQL_PSW}"
            env.SONAR_TOKEN = "${SONAR_CLOUDOBJ_PSW}"
            //sh "mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -D sonar.projectKey=sheenilim08_devops-and-cloud-handson"
            bat "mvn --version"
            run "mvn -B verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -D sonar.projectKey=Danish1103_DevOps-Project"
          }
        }
      }
    } 

     stage('Part 2 - Maven Compile and Build Artifact') {
      steps {
        script {
          dir("Part-2") {
            bat "mvn clean"
            bat "mvn compile"
            bat "mvn package"
          }
        }
      }
    } */
  }
}
