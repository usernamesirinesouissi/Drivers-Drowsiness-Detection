pipeline {
    agent any

    environment {
        // Définissez l'identifiant de vos credentials pour accéder à GCP
        GOOGLE_APPLICATION_CREDENTIALS = credentials('id-des-credentials-google')
        PROJECT_ID = 'my-projectdl-420911'
        CLUSTER_NAME = 'streamlit-cluster'
        ZONE = 'us-central1-a'
        IMAGE = 'gcr.io/my-projectdl-420911/clouds-sirine'
        APP_PATH = 'deployment.yaml' 
    }

    stages {
        stage('Préparation') {
            steps {
                script {
                    // Changez de répertoire
                    dir('Drivers-Drowsiness-Detection') {
                        echo "Changement de répertoire réussi"
                    }
                }
            }
        }

        stage('Configuration de l\'environnement GCP') {
            steps {
                script {
                    // Authentifier gcloud et configurer le projet
                    sh 'gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS'
                    sh 'gcloud config set project $PROJECT_ID'
                }
            }
        }
        
        stage('Construction et push de l\'image Docker') {
            steps {
                script {
                    dir('Drivers-Drowsiness-Detection') {
                        // Construction et tag de l'image Docker
                        sh 'docker build -t clouds .'
                        sh 'docker tag clouds $IMAGE'
                        // Push de l'image Docker
                        sh 'docker push $IMAGE'
                    }
                }
            }
        }

        stage('Déploiement sur Kubernetes') {
            steps {
                script {
                    // Configurer l'accès au cluster Kubernetes
                    sh 'gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE'
                    // Appliquer la configuration Kubernetes
                    sh 'kubectl apply -f deployment.yaml'
                    // Vérifier l'état des services, déploiements, et pods
                    sh 'kubectl get svc'
                    sh 'kubectl get deployments'
                    sh 'kubectl get pods'
                }
            }
        }

        stage('Déploiement sur App Engine') {
            steps {
                // Déployer l'application sur Google App Engine
                sh 'gcloud app deploy $APP_PATH'
            }
        }
    }
}

