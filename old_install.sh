#!/bin/bash

# Salir si el script se ejecuta como root (por seguridad)
if [ "$(whoami)" == "root" ]; then
    exit 1
fi

# Guardar la ruta absoluta donde está el script
ruta="$(cd "$(dirname "$0")" && pwd)"

# ────────────────────────────────────────────────
# 📦 Dependencias base del entorno de ventanas
# ────────────────────────────────────────────────
sudo apt install -y build-essential git vim libxcb-util0-dev libxcb-ewmh-dev \
libxcb-icccm4-dev libxcb-randr0-dev libxcb-xinerama0-dev libx11-xcb-dev \
libxcb-xkb-dev libxcb-cursor-dev libxcb-keysyms1-dev libxkbcommon-dev

# ────────────────────────────────────────────────
# 🖥️ Requisitos para Polybar (barra de estado)
# ────────────────────────────────────────────────
sudo apt install -y polybar cmake cmake-data pkg-config python3-sphinx \
libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev \
python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev \
libjsoncpp-dev libasound2-dev libpulse-dev libmpdclient-dev libcurl4-openssl-dev

# ────────────────────────────────────────────────
# 💨 Dependencias para Picom (compositor)
# ────────────────────────────────────────────────
sudo apt install -y meson picom libxext-dev libxcb1-dev libxcb-damage0-dev \
libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev \
libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev \
libpcre2-dev libevdev-dev uthash-dev

# ────────────────────────────────────────────────
# 🔒 Dependencias de i3lock-color (bloqueador de pantalla personalizado)
# ────────────────────────────────────────────────
sudo apt update
sudo apt install -y autoconf gcc make pkg-config libpam0g-dev libcairo2-dev \
libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev \
libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev \
libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev \
libjpeg-dev libgif-dev

# ────────────────────────────────────────────────
# 🎯 Paquetes adicionales útiles para el entorno
# ────────────────────────────────────────────────
sudo apt install -y kitty feh scrot scrub rofi xclip bat locate ranger wmname \
i3lock pavucontrol blueman

# ────────────────────────────────────────────────
# 📥 Clonamos Polybar y Picom
# ────────────────────────────────────────────────
mkdir -p ~/github
cd ~/github
git clone --recursive https://github.com/polybar/polybar
git clone https://github.com/ibhagwan/picom.git
git clone https://github.com/Raymo111/i3lock-color.git
git clone https://github.com/newmanls/rofi-themes-collection.git
git clone https://github.com/PrayagS/polybar-spotify.git ~/.config/bin/spotify_status

# ────────────────────────────────────────────────
# ⚙️ Compilamos Polybar
# ────────────────────────────────────────────────
cd ~/github/polybar
mkdir build && cd build
cmake ..
make -j"$(nproc)"
sudo make install

# ────────────────────────────────────────────────
# ⚙️ Compilamos Picom
# ────────────────────────────────────────────────
cd ~/github/picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# ────────────────────────────────────────────────
# ⚙️ Compilamos i3lock-color
# ────────────────────────────────────────────────
cd ~/github/i3lock-color
./install-i3lock-color.sh

# ────────────────────────────────────────────────
# 🪟 Instalar BSPWM y SXHKD
# ────────────────────────────────────────────────
cd ~/github
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

# Compilar e instalar BSPWM
cd bspwm
make
sudo make install

# Compilar e instalar SXHKD
cd ../sxhkd
make
sudo make install

# Crear entrada de sesión para el gestor de display
sudo tee /usr/share/xsessions/bspwm.desktop > /dev/null <<EOF
[Desktop Entry]
Name=BSPWM
Comment=Binary Space Partitioning Window Manager
Exec=bspwm
TryExec=bspwm
Type=Application
EOF


# ────────────────────────────────────────────────
# ⚙️ Compilamos ipolybar_spotify
# ────────────────────────────────────────────────
cd ~/.config/bin/spotify_status
./get_spotify_status.sh


# ────────────────────────────────────────────────
# 🌟 Instalación Powerlevel10k
# ────────────────────────────────────────────────
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k
echo 'source /root/.powerlevel10k/powerlevel10k.zsh-theme' | sudo tee -a /root/.zshrc

# ────────────────────────────────────────────────
# 🎨 Configuraciones y archivos personales
# ────────────────────────────────────────────────
mkdir -p ~/.config/rofi/themes
cp "$ruta/rofi/nord.rasi" ~/.config/rofi/themes/
cp -v ~/github/rofi-themes-collection/themes/* ~/.config/rofi/themes/

mkdir -p ~/.config/i3
cp -v "$ruta/config/i3/lock.sh" ~/.config/i3/lock.sh
chmod +x ~/.config/i3/lock.sh

sudo dpkg -i "$ruta/lsd.deb"

sudo cp -v "$ruta/fonts/HNF/"* /usr/local/share/fonts/
sudo cp -v "$ruta/Config/polybar/fonts/"* /usr/share/fonts/truetype/
sudo fc-cache -fv

# ────────────────────────────────────────────────
# 🔤 Instalar y configurar nerd fonts
# ────────────────────────────────────────────────

# Copiar todas las fuentes del repo al sistema
sudo cp -v "$ruta/Fonts2/fonts/"* /usr/local/share/fonts/

# Recargar caché de fuentes
sudo fc-cache -fv

# Configurar Polybar para usar nerd fonts
polybar_config="$HOME/.config/polybar/config"
if [ -f "$polybar_config" ]; then
    sed -i 's|^font-0 =.*|font-0 = "Hurmit Nerd Font Mono:size=10;1"|' "$polybar_config"
    sed -i 's|^font-1 =.*|font-1 = "Iosevka Nerd Font Complete:size=10;1"|' "$polybar_config"
fi

# ────────────────────────────────────────────────
# 📦 Instalar paquetes adicionales del repo (apt, flatpak, snap)
# ────────────────────────────────────────────────

# 1️⃣ Paquetes
xargs -a $ruta/paquetes/paquetes.txt sudo apt install -y

# 2️⃣ Flatpak
# Asegurarse de que Flatpak esté instalado
sudo apt install -y flatpak

# Añadir Flathub como remoto para el usuario
flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo

# Leer flatpak.txt y ejecutar instalación
flatpak_txt="$ruta/paquetes/flatpak.txt"
if [ -f "$flatpak_txt" ]; then
    while read -r nombre id rest; do
        # Ignorar líneas vacías o comentarios
        [[ -z "$id" ]] && continue
        echo "🔄 Instalando Flatpak: $nombre ($id)"
        flatpak install -y --user flathub "$id" || echo "⚠️ Ya instalado o fallo: $id"
    done < "$flatpak_txt"
fi

# 3️⃣ Snap
sudo apt install -y snapd

snap_txt="$ruta/paquetes/snaps.txt"
if [ -f "$snap_txt" ]; then
    while read -r nombre _; do
        [[ -z "$nombre" ]] && continue
        if [[ "$nombre" == "firefox" || "$nombre" == "snap-store" || "$nombre" == "spotify" ]]; then
            echo "🔄 Instalando Snap: $nombre"
            sudo snap install "$nombre"
        fi
    done < "$snap_txt"
fi

# 🔗 Hacer visible Spotify en Rofi
sudo ln -sf /var/lib/snapd/desktop/applications/spotify_spotify.desktop /usr/share/applications/

# 🔗 Hacer visible vscode en Rofi
sudo ln -sf /var/lib/snapd/desktop/applications/code-code.desktop /usr/share/applications/

mkdir -p ~/Wallpaper ~/ScreenShots
cp -v "$ruta/Wallpaper/"* ~/Wallpaper

rm -rf ~/.config/polybar
cp -rv "$ruta/Config/"* ~/.config/

rm -f ~/.zshrc
cp -v "$ruta/.zshrc" ~/.zshrc
cp -v "$ruta/.p10k.zsh" ~/.p10k.zsh
sudo cp -v "$ruta/.p10k.zsh-root" /root/.p10k.zsh

sudo cp -v "$ruta/scripts/whichSystem.py" /usr/local/bin/
sudo cp -v "$ruta/scripts/screenshot" /usr/local/bin/

# ────────────────────────────────────────────────
# 🔌 Plugins ZSH
# ────────────────────────────────────────────────
sudo apt install -y zsh-syntax-highlighting zsh-autosuggestions
sudo mkdir -p /usr/share/zsh-sudo
cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

sudo ln -sfv ~/.zshrc /root/.zshrc

chsh -s $(which zsh) $USER

# ────────────────────────────────────────────────
# 🛠️ Permisos de ejecución
# ────────────────────────────────────────────────
chmod +x "$ruta/theme.sh"
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/bin/ethernet_status.sh
chmod +x ~/.config/bin/htb_status.sh
chmod +x ~/.config/bin/htb_target.sh
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.config/bin/spotify_status/get_spotify_status.sh
sudo chmod +x /usr/local/bin/whichSystem.py
sudo chmod +x /usr/local/bin/screenshot

# ────────────────────────────────────────────────
# 🚀 Ejecutamos theme.sh
# ────────────────────────────────────────────────
clear
echo "Selecciona un theme en el selector"
"$ruta/theme.sh"

notify-send "✅ BSPWM INSTALADO"
