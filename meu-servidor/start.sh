#!/bin/bash

echo "Baixando servidor Minecraft..."

# Substitua com o ID do seu arquivo no Drive
FILE_ID="1UWps-gQutx2s3WqZY9uU7CAzjxSF0qrn"
FILE_NAME="servidor.zip"

# Baixa o arquivo lidando com a proteção do Google Drive
curl -c /tmp/cookies "https://drive.google.com/uc?export=download&id=${FILE_ID}" -s > /tmp/intermezzo.html

CODE="$(awk '/confirm=/{print $NF}' /tmp/intermezzo.html)"

curl -Lb /tmp/cookies "https://drive.google.com/uc?export=download&confirm=${CODE}&id=${FILE_ID}" -o "${FILE_NAME}"

echo "Descompactando servidor..."
unzip -o "${FILE_NAME}" -d .

echo "Aceitando EULA..."
echo "eula=true" > eula.txt

echo "Iniciando servidor Minecraft..."
java -Xmx4G -jar fabric-server-launch.jar nogui