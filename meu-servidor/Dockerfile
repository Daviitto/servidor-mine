FROM openjdk:21-jdk-slim

# evita prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# 1) Atualiza cache, instala dependências e limpa listas
RUN apt-get update \
 && apt-get install -y \
    curl \
    unzip \
    python3 \
    python3-pip \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# 2) Instala o gdown via pip
RUN pip3 install --no-cache-dir gdown

# 3) Copia e libera permissão do start.sh
COPY start.sh .
RUN chmod +x start.sh

# 4) Ponto de entrada
CMD ["bash", "start.sh"]
