#!/bin/bash

# dropletorrent.sh
# 🌀 Script para armar un entorno exprés de descarga torrent usando un droplet temporal
# Requiere: Ubuntu (con acceso root)

# 1. Actualiza paquetes
apt update && apt upgrade -y

# 2. Instala herramientas necesarias
apt install -y qbittorrent-nox zip ufw python3

# 3. Abre puertos necesarios
ufw allow 8080  # Web UI de qBittorrent
ufw allow 9000  # Servidor HTTP para bajar el archivo final
ufw --force enable

# 4. Lanza qBittorrent en segundo plano usando nohup y guarda log
nohup qbittorrent-nox > /root/qbt.log 2>&1 &
sleep 3  # da tiempo para generar el password

# 5. Muestra acceso a Web UI y credenciales
IP=$(curl -s ifconfig.me)
PASSWORD=$(grep -oP 'Password set to: \K.*' /root/qbt.log)

echo "\n\n🚀 Todo listo."
echo "\ud83d\udd0d Web UI: http://$IP:8080"
echo "🔑 Usuario: admin"
echo "🔑 Contraseña: $PASSWORD"
echo "\n💼 Cuando termine de descargar tu torrent, empaqueta así:"

# 6. Detecta carpeta más reciente
CARPETA=$(find ~/Downloads -mindepth 1 -maxdepth 1 -type d -printf '%T+ %p\n' | sort -r | head -n1 | cut -d' ' -f2-)

if [ -n "$CARPETA" ]; then
    BASENAME=$(basename "$CARPETA")
    echo "\ud83d\udcc2 Carpeta detectada: $BASENAME"
    echo "📆 Comando para empaquetar sin compresión:"
    echo "    cd ~/Downloads"
    echo "    zip -r -0 \"$BASENAME.zip\" \"$BASENAME\""
    echo "\n📦 Para servir tu archivo en el puerto 9000:"
    echo "    python3 -m http.server 9000"
    echo "\n📱 Descarga desde tu navegador en:"
    echo "    http://$IP:9000/$BASENAME.zip"
else
    echo "⚠️ No se encontró carpeta en ~/Downloads"
fi

echo "\n🚨 Recuerda: borra tu droplet una vez que hayas descargado el archivo.\n"

