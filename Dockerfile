# Utiliser l'image Python 3.10 comme base
FROM python:3.10

# Définir le répertoire de travail à l'intérieur du conteneur
WORKDIR /app

# Mettre à jour les listes de paquets et installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y python3 python3-pip ffmpeg libsm6 libxext6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copier le fichier requirements.txt dans le conteneur à /app
COPY requirements.txt /app/requirements.txt

# Copier le contenu du répertoire courant dans le conteneur à /app
COPY . /app

# Installer les packages spécifiés dans requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copier le dossier .streamlit dans le conteneur à /app/.streamlit
COPY .streamlit/ .streamlit/

# Exposer le port 8501
ENV PORT=8501
EXPOSE $PORT

# Définir la commande par défaut pour exécuter l'application Streamlit
CMD ["streamlit", "run", "streamlit_app.py", "--server.port=8501"]

