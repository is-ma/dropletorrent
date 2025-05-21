# 🛠️ DropleTorrent

DropleTorrent es un script sencillo para levantar un droplet en DigitalOcean (o VPS similar), instalar `qbittorrent-nox`, descargar un torrent sin bloqueos del ISP, y luego empaquetarlo para bajarlo rápidamente.

Ideal para quienes:
- Tienen bloqueos de torrents en casa (como con Totalplay, Telmex, etc).
- Quieren descargar contenido en el celular sin usar apps p2p.
- Necesitan una solución rápida y descartable.

---

## ⚡️ Beneficios

- No requiere mantener servidores activos.
- No deja rastros en tu red local.
- Evita throttling o censura de torrents.
- Es barato: puedes usar droplets por hora y destruir al terminar (aprox. $0.009 USD/hora).

---

## 🔄 Flujo de trabajo

1. **Lanza tu droplet Ubuntu** (por ejemplo, en DigitalOcean).
2. **Conéctate como root y ejecuta el script**:

   ```bash
   curl -O https://raw.githubusercontent.com/is-ma/dropletorrent/main/dropletorrent.sh
   bash dropletorrent.sh

