import java.text.SimpleDateFormat

pipeline {
    agent any

    options {
        disableConcurrentBuilds()
    }

    stages {
        stage('Run') {
            steps {
                sh "./build.sh"
                sh "./deploy.sh"
            }
        }
    }
}
