pipeline {
  agent any
  stages {
    stage('Checkout Application Git Branch') {
        steps {
            git credentialsId: 'happydraw',
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
   stage('k8s manifest file update') {
      steps {
        git credentialsId: 'happydraw',
            url: 'https://github.com/oolr/msaka_deploy.git',
            branch: 'main'
        
        // 이미지 태그 변경 후 메인 브랜치에 푸시
        sh "git config --global user.email jyy013@gmail.com"
        sh "git config --global user.name oolr"
        sh "sed -i 's|main:.*|main:${BUILD_NUMBER}|g' main.yml"
	sh "sed -i 's|board:.*|board:${BUILD_NUMBER}|g' board.yml"
	sh "sed -i 's|product:.*|product:${BUILD_NUMBER}|g' product.yml"
        sh "git add ."
        sh "git commit -m '[UPDATE] POD ${BUILD_NUMBER} image versioning'"
        sh "git branch -M main"
        sh "git remote remove origin"
        sh "git remote add origin git@github.com:oolr/msaka_deploy.git"
        sh "git push -u origin main"
      }
      post {
        failure {
          echo 'k8s manifest file update failure'
        }
        success {
          echo 'k8s manifest file update success'  
        }
      }
    }
   }
}
