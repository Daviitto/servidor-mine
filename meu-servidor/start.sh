#!/bin/bash
set -e

FILE_ID="1UWps-gQutx2s3WqZY9uU7CAzjxSF0qrn"
FILE_NAME="servidor.zip"

cd /app

# Baixa só se não existir
if [ ! -f "$FILE_NAME" ]; then
  echo "Baixando servidor Minecraft do Drive..."

  # Primeiro request para obter o cookie e o código de confirmação
  curl -c /tmp/cookies \
       "https://drive.google.com/uc?export=download&id=${FILE_ID}" \
       -s -L > /tmp/intermezzo.html

  # Extrai o token de confirmação da página
  CONFIRM=$(grep -o 'confirm=[^;&]*' /tmp/intermezzo.html | sed 's/confirm=//')

  # Segundo request para baixar o arquivo usando o cookie e o token
  curl -Lb /tmp/cookies \
       "https://drive.google.com/uc?export=download&confirm=${CONFIRM}&id=${FILE_ID}" \
       -L -o "$FILE_NAME"
fi

echo "Download completo. Verificando ZIP..."
# checa se é um zip válido
if ! unzip -tq "$FILE_NAME" > /dev/null; then
  echo "Erro: servidor.zip inválido ou corrompido." >&2
  exit 1
fi

echo "Descompactando servidor..."
unzip -o "$FILE_NAME" -d .

# Ajuste abaixo se seu ZIP criar uma pasta diferente de "Server"
cd Server

echo "Aceitando EULA..."
echo "eula=true" > eula.txt

echo "Iniciando servidor Minecraft..."
exec java -Xmx4G -jar fabric-server-launch.jar nogui
