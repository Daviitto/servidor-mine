#!/bin/bash
set -e

echo "Baixando servidor Minecraft com gdown..."

# ID do seu arquivo no Drive
FILE_ID="1UWps-gQutx2s3WqZY9uU7CAzjxSF0qrn"
FILE_NAME="servidor.zip"

# Baixa direto com gdown (ele lida com tokens de confirmação)
python3 -m gdown --id $FILE_ID -O $FILE_NAME

echo "Descompactando servidor..."
unzip -o "$FILE_NAME" -d .

echo "Aceitando EULA..."
echo "eula=true" > eula.txt

echo "Iniciando servidor Minecraft..."
java -Xmx4G -jar fabric-server-launch.jar nogui
