#!/bin/bash

echo "Baixando servidor.zip..."
wget -O servidor.zip "https://drive.usercontent.google.com/download?id=1UWps-gQutx2s3WqZY9uU7CAzjxSF0qrn&export=download"

echo "Descompactando servidor..."
unzip servidor.zip || { echo "Erro ao descompactar o servidor."; exit 1; }

echo "Iniciando servidor..."
java -Xmx4G -jar server.jar nogui
