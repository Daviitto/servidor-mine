#!/bin/bash

FILE="server.zip"

# Se ainda não foi baixado, baixa o arquivo do Google Drive
if [ ! -f "$FILE" ]; then
  echo "Baixando servidor..."
  curl -L -o "$FILE" "https://drive.google.com/uc?export=download&id=1ssIVv0bcUXVMUckjxUQNOMglysk38Yy2"
fi

# Descompacta os arquivos na pasta 'server'
if [ ! -d "server" ]; then
  unzip "$FILE" -d server
fi

# Inicia o servidor
cd server
java -Xmx4G -jar fabric-server-launch.jar nogui