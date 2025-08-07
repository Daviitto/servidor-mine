FROM openjdk:21-jdk-slim
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Atualiza e instala dependências básicas + ferramentas de build
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    ca-certificates \
    python3 \
    python3-pip \
    build-essential \
    gcc \
 && rm -rf /var/lib/apt/lists/*

# Instala o gdown
RUN pip3 install --no-cache-dir gdown

# Copia o script
COPY start.sh .
RUN chmod +x start.sh

CMD ["bash", "start.sh"]
