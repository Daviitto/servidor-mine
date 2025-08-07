FROM openjdk:21-jdk-slim
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Instala curl, unzip, python3, pip e gdown
RUN apt-get update \
 && apt-get install -y \
    curl \
    unzip \
    ca-certificates \
    python3 \
    python3-pip \
 && pip3 install --no-cache-dir gdown \
 && rm -rf /var/lib/apt/lists/*

# Copia o script start.sh e dá permissão
COPY start.sh .
RUN chmod +x start.sh

# Executa o script
CMD ["bash", "start.sh"]
