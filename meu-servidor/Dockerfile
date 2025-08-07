FROM openjdk:21-jdk-slim
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# instala só o que precisamos: curl, unzip e certificados
RUN apt-get update \
 && apt-get install -y \
    curl \
    unzip \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# copia o start.sh e garante permissão
COPY start.sh .
RUN chmod +x start.sh

# executa o script
CMD ["bash", "start.sh"]
