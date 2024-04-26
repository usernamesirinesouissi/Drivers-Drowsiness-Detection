pipeline {
    agent any

    environment {
        // Définissez l'identifiant de vos credentials pour accéder à GCP
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-project-service-account')
        PROJECT_ID = 'my-projectdl-420911'
        CLUSTER_NAME = 'streamlit-cluster'
        ZONE = 'us-central1-a'
        IMAGE = 'gcr.io/my-projectdl-420911/clouds-sirine'
    }

    stages {
        stage('Set GCP Project') {
            steps {
                // Utilisez la variable PROJECT_ID pour configurer le projet GCP
                sh 'gcloud config set project ${PROJECT_ID}'
            }
        }
        // Vous pouvez ajouter d'autres étapes ici selon vos besoins de déploiement
    }
}

