pipeline {
    agent any

    stages {
        stage('Installation des dépendances') {
            steps {
                sh 'pip install --no-cache-dir -r requirements.txt'
            }
        }
        stage('Préparation des données') {
            steps {
                sh 'jupyter nbconvert --execute "Data Preparation.ipynb"'
            }
        }
        stage('Entrainement du modèle') {
            steps {
                sh 'jupyter nbconvert --execute "Model Training.ipynb"'
            }
        }
        stage('Déploiement de l\'application Streamlit') {
            steps {
                sh 'streamlit run streamlit_app.py'
            }
        }
    }
}

