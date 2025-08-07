
#!/bin/bash

echo "Baixando servidor.zip..."
gdown https://drive.google.com/uc?id=1UWps-gQutx2s3WqZY9uU7CAzjxSF0qrn -O servidor.zip

echo "Descompactando servidor.zip..."
unzip servidor.zip

echo "Iniciando servidor Minecraft..."
cd servidor
java -Xmx4G -jar server.jar nogui
