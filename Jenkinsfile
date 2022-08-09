#!/usr/bin/env groovy

pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    
    triggers {
        // Daily build, at 6 AM (server time), every business day
        cron('H 6 * * 1-5')
    }
    stages {
        stage('check docker') {
            steps {
                sh "docker --version"
                sh "docker-compose --version"
                sh "docker info"
            }
        }

        
        stage('build') {
            steps {
                script {
                    
                        def customImage = docker.build(
                            "test",
                            "--build-arg TAG=test --build-arg VCS_REF=`git rev-parse --short HEAD` --build-arg BUILD_DATE=`date -u +'%Y-%m-%dT%H:%M:%SZ'` -f Dockerfile.alpine ."
                        )
                    
                }
            }
        }
        

    }
    
}
