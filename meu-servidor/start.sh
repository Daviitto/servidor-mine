#!/bin/bash
set -e

FILE_ID="1UWps-gQutx2s3WqZY9uU7CAzjxSF0qrn"
FILE_NAME="servidor.zip"

cd /app

# só baixa novamente se não existir
if [ ! -f "$FILE_NAME" ]; then
  echo "Baixando servidor Minecraft..."
  curl -L "https://drive.google.com/uc?export=download&id=${FILE_ID}" \
       -o "${FILE_NAME}"
fi

echo "Descompactando servidor..."
unzip -o "$FILE_NAME" -d .

# entra na pasta onde foi extraído
cd Server

echo "Aceitando EULA..."
echo "eula=true" > eula.txt

echo "Iniciando servidor Minecraft..."
exec java -Xmx4G -jar fabric-server-launch.jar nogui
