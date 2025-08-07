FROM openjdk:21-jdk-slim
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Instala curl, unzip e wget
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    wget \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Copia o script de inicialização
COPY start.sh .
RUN chmod +x start.sh

# Roda o script
CMD ["bash", "start.sh"]
