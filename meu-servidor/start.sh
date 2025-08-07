#!/bin/bash

# Aceita o EULA automaticamente
echo "eula=true" > eula.txt

# Baixar servidor.zip do Google Drive
echo "Baixando servidor.zip..."
wget -O servidor.zip "https://drive.google.com/uc?export=download&id=1UWps-gQutx2s3WqZY9uU7CAzjxSF0qrn"

# Verificar se o zip foi baixado corretamente
if unzip -t servidor.zip > /dev/null 2>&1; then
    echo "Arquivo ZIP válido. Descompactando..."
    unzip -o servidor.zip -d Server
else
    echo "Erro: servidor.zip inválido ou corrompido."
    exit 1
fi

# Ir para a pasta do servidor
cd Server || { echo "Pasta Server não encontrada."; exit 1; }

# Iniciar servidor
echo "Iniciando servidor Minecraft..."
java -Xmx4G -jar fabric-server-launch.jar nogui
