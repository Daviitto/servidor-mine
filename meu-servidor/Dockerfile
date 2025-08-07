FROM openjdk:17-jdk-slim

WORKDIR /app

# Instala curl, unzip, Python e o pip
RUN apt update && \
    apt install -y curl unzip python3 python3-pip && \
    pip3 install --no-cache gdown

# Copia o script
COPY start.sh .

# Permissão
RUN chmod +x start.sh

# Inicia
CMD ["bash", "start.sh"]
