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
- Es barato: puedes usar droplets por hora y destruir al terminar.

---

## 🔄 Flujo de trabajo

1. **Lanza tu droplet Ubuntu** (por ejemplo, en DigitalOcean).
2. **Conéctate como root y ejecuta el script**:

   ```bash
   curl -O https://raw.githubusercontent.com/is-ma/dropletorrent/main/dropletorrent.sh
   bash dropletorrent.sh
   ```

3. **Accede a la interfaz web de qBittorrent** y pega tu .torrent o magnet link.

4. **Cuando termine de bajar**, sigue las instrucciones que el script te da para empaquetar el contenido y descargarlo vía HTTP desde tu navegador o celular.

5. **Borra tu droplet**. ✅

---

## 📅 Casos de uso

- Cursos online (videos, PDFs, audios)
- Packs de libros o música
- Archivos grandes compartidos en torrents públicos

---

## 👻 Advertencia amistosa

Este script está pensado para uso personal y legal. No fomenta ni apoya la piratería de contenido con derechos de autor.

---

## 🚀 Contribuciones

Ideas, mejoras y forks son bienvenidos. Puedes sugerir integraciones con Docker, versión con interfaz, sistema de notificaciones, etc.

---

Happy torrenting, 
**- El equipo invisible de DropleTorrent 🌌**

