FROM openjdk:21-jdk-slim
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Atualiza repositórios
RUN apt-get update

# Instala pacotes
RUN apt-get install -y \
    curl \
    unzip \
    ca-certificates \
    python3 \
    python3-pip

# Instala gdown com pip
RUN pip3 install --no-cache-dir gdown

# Remove cache
RUN rm -rf /var/lib/apt/lists/*

# Copia o script de inicialização
COPY start.sh .
RUN chmod +x start.sh

# Comando de inicialização
CMD ["bash", "start.sh"]
