pipeline {
  agent any
  stages {
    stage('Checkout Application Git Branch') {
        steps {
            git credentialsId: 'private_key',
                url: 'https://github.com/oolr/msaka.git', /* URL변경에 따른 수정 필요 */
                branch: 'main'
        }
        post {
                failure {
                  echo 'Repository clone failure !'
                }
                success {
                  echo 'Repository clone success !'
                }
        }
    }
    stage('git scm update') {
      steps {
        git url: 'https://github.com/oolr/msaka.git', branch: 'main'
      }
    }
	
   stage('docker build') {
      steps {
        sh '''
        docker build -t main -f Dockerfile-m .
        docker build -t board -f Dockerfile-b .
        docker build -t product -f Dockerfile-p .
        '''
      }
    }
   stage('main img push') {
      steps {      
	sh '''
	docker tag main 582858263322.dkr.ecr.ap-northeast-2.amazonaws.com/happydraw-main:${BUILD_NUMBER}
        aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 582858263322.dkr.ecr.ap-northeast-2.amazonaws.com/happydraw-main
        docker image push 582858263322.dkr.ecr.ap-northeast-2.amazonaws.com/happydraw-main:${BUILD_NUMBER}
        '''
      }
    }
   stage('product img push') {
      steps {
        sh '''
        docker tag product 582858263322.dkr.ecr.ap-northeast-2.amazonaws.com/happydraw-product:${BUILD_NUMBER}
        aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 582858263322.dkr.ecr.ap-northeast-2.amazonaws.com/happydraw-product
        docker image push 582858263322.dkr.ecr.ap-northeast-2.amazonaws.com/happydraw-product:${BUILD_NUMBER}
        '''
      }
    }
   stage('board img push') {
      steps {
        sh '''
        docker tag board 582858263322.dkr.ecr.ap-northeast-2.amazonaws.com/happydraw-board:${BUILD_NUMBER}
        aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 582858263322.dkr.ecr.ap-northeast-2.amazonaws.com/happydraw-board
        docker image push 582858263322.dkr.ecr.ap-northeast-2.amazonaws.com/happydraw-board:${BUILD_NUMBER}
        '''
      }
    }
	  
   stage('K8S Manifest Update') {
       steps {
            git credentialsId: 'private_key',
                url: 'https://github.com/oolr/msaka.git', /* URL변경에 따른 수정 필요 */
                branch: 'main'
            sh "git config --global user.email 'jyy013@gmail.com'"
            sh "git config --global user.name 'oolr'"
            sh "sed -i 's|main:.*|main:${BUILD_NUMBER}|g' main.yml "
	    sh "sed -i 's|board:.*|board:${BUILD_NUMBER}|g' board.yml "
	    sh "sed -i 's|product:.*|product:${BUILD_NUMBER}|g' product.yml "
            sh "git add ."
            sh "git commit -m '[UPDATE] POD ${BUILD_NUMBER} image versioning'" 
            sshagent (credentials: ['happydraw']) {
                sh "git remote set-url origin git@github.com:oolr/msaka.git"
                sh "git push origin main" 
            }  
        }
    }
   }
  }
