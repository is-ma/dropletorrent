#!/bin/bash

# dropletorrent.sh
# 🌐 Script para armar un entorno exprés de descarga torrent usando un droplet temporal
# Requiere: Ubuntu (con acceso root)

# ★ INICIO DE INSTALACIÓN
clear
echo ""
echo "**************************************"
echo "🌐 Iniciando instalación de paquetes..."
echo "**************************************"
echo ""

# 1. Actualiza paquetes
apt update && apt upgrade -y

# 2. Instala herramientas necesarias
apt install -y qbittorrent-nox zip ufw python3

# 3. Abre puertos necesarios
ufw allow 8080  # Web UI de qBittorrent
ufw allow 9000  # Servidor HTTP para bajar el archivo final
ufw --force enable

# ★ FIN DE INSTALACIÓN
clear
echo ""
echo "**************************************"
echo "🚀 Instalación completada. Lanzando qBittorrent..."
echo "**************************************"
echo ""

# 4. Lanza qBittorrent en segundo plano usando nohup y guarda log
nohup qbittorrent-nox > /root/qbt.log 2>&1 &
sleep 3  # da tiempo para generar el password

# 5. Muestra acceso a Web UI y credenciales
IP=$(curl -s ifconfig.me)
PASSWORD=$(grep -oP 'temporary password is provided for this session: \K.*' /root/qbt.log)

echo ""
echo "🚀 Todo listo."
echo "🔍 Web UI: http://$IP:8080"
echo "🔑 Usuario: admin"
echo "🔑 Contraseña: ${PASSWORD:-(no encontrada, revisa /root/qbt.log)}"
echo ""
echo "💼 Cuando termine de descargar tu torrent, empaqueta así:"
echo "    cd ~/Downloads"
echo "    zip -r -0 \"nombre_del_curso.zip\" \"Carpeta_del_curso\""
echo ""
echo "📦 Luego sirve tu archivo con:"
echo "    python3 -m http.server 9000"
echo ""
echo "📱 Y descárgalo desde tu navegador en:"
echo "    http://$IP:9000/"
echo ""
echo "🚨 Recuerda: borra tu droplet una vez que hayas descargado el archivo."
echo ""

