# Usa la imagen oficial de N8N como base
FROM docker.n8n.io/n8nio/n8n:latest

# Instala Python y pip
# se da de baja este código ya que la nueva versión de la imagen oficial de n8n ya no esta basada en DEBIAN, si no esta basada en ALPINE
# Alpine es mas liviana y seguroa, pero la instalación de paquetes es diferente
# por lo tanto, este Dockerfile se depreca el uso de apt-get para instalar paaquetes especificos, en su lugar se dbee usar "apk add"
#RUN apt-get update && apt-get install -y \
#    python3 \
#    python3-pip \
#    && apt-get clean \
#    && rm -rf /var/lib/apt/lists/*

# Verifica las versiones instaladas (opcional)
#RUN python3 --version && pip3 --version