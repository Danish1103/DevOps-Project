pipeline {
  agent any

  environment {
    SONAR_CLOUDOBJ = credentials('SONAR_TOKEN')
  }

  stages {
    stage('Part 2 - Scan Repo with SonarCloud') {
      steps {
        script {
          withCredentials([
            string(
              credentialsId: 'SONAR_TOKEN',
              variable: 'SONAR_TOKEN'
            )
          ]) {
            dir("Part-2") {
              set M2_HOME=C:\ProgramData\chocolatey\lib\maven\apache-maven-3.9.3
              set path=C:\ProgramData\chocolatey\lib\maven\apache-maven-3.9.3\bin:%path%
              bat 'mvn --version'
              run 'mvn -B verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=Danish1103_DevOps-Project'
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
