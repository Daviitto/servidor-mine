FROM openjdk:17-jdk-slim

WORKDIR /app

# Instalar ferramentas necessárias
RUN apt update && apt install -y curl unzip

# Copia o script para dentro do container
COPY start.sh .

# Dá permissão de execução ao script
RUN chmod +x start.sh

# Executa o script ao iniciar
CMD ["bash", "start.sh"]
