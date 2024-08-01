pipeline{
    agent {
        node{
            label 'docker-agent-node'
        }
    }
    stages{
        stage('Package'){
            steps{
                sh '''
                tar czf introtodevops-$BUILD_NUMBER.tar.gz introtodevops
                '''
            }
        }
        stage('Deploy'){
            steps{
                sshPublisher(
                    publishers: [
                    sshPublisherDesc(
                    configName: 'earnhiveserver', 
                    transfers: [sshTransfer(
                    cleanRemote: false, excludes: '', 
                    execCommand: '''sudo rm -rf /var/www/introtodevops/introtodevops-*.tar.gz 
                    sudo mv /home/ubuntu/introtodevops-*.tar.gz /var/www/introtodevops/;
                    cd /var/www/introtodevops/;
                    sudo tar -xf introtodevops-*.tar.gz;
                    cd /var/www/introtodevops/introtodevops/;
                    sudo chmod +x deploy.sh;
                    ./deploy.sh; 
                    ''', 
                    execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, 
                    patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', 
                    sourceFiles: '**/*.gz')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)
                    ]
                )
            }
        }
    }
}