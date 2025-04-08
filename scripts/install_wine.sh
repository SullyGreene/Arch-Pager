#!/bin/bash

# Arch Linux Wine Setup with Sandbox & Menu Entries
# Last updated: 2025-04-07

echo "==> Updating system..."
sudo pacman -Syu --noconfirm

echo "==> Enabling multilib (if not already enabled)..."
if ! grep -q "\[multilib\]" /etc/pacman.conf; then
    sudo sed -i '/#\[multilib\]/,/#Include = \/etc\/pacman.d\/mirrorlist/ s/#//' /etc/pacman.conf
    sudo pacman -Syy
fi

echo "==> Installing Wine Staging + Tools..."
sudo pacman -S --noconfirm wine-staging wine-gecko wine-mono winetricks

echo "==> Installing audio and graphics dependencies..."
sudo pacman -S --noconfirm \
    lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-pipewire pipewire-pulse \
    lib32-libcups lib32-mesa lib32-vulkan-icd-loader \
    lib32-gnutls lib32-sdl2 lib32-gst-plugins-base lib32-gst-plugins-good lib32-gst-libav

# Ask user for 32-bit or 64-bit prefix
read -p "Choose Wine prefix architecture [32/64]: " WINEBITS
if [[ "$WINEBITS" == "32" ]]; then
    export WINEARCH=win32
    export WINEPREFIX="$HOME/.wine32"
else
    export WINEARCH=win64
    export WINEPREFIX="$HOME/.wine64"
fi

echo "==> Creating Wine prefix at $WINEPREFIX..."
wineboot -u

# Ask to create a sandbox user
read -p "Create a sandbox Wine user (recommended)? [y/N]: " SANDBOX
if [[ "$SANDBOX" =~ ^[Yy]$ ]]; then
    echo "==> Creating sandbox user 'wineuser'..."
    sudo useradd -m -s /bin/bash wineuser 2>/dev/null || echo "User already exists."
    xhost +SI:localuser:wineuser
    echo "==> You can now run apps with:"
    echo "    sudo -u wineuser env HOME=/home/wineuser WINEPREFIX=$WINEPREFIX wine yourapp.exe"
fi

# Ask to create desktop menu entries
read -p "Create Wine menu entries (Configure, Uninstall, Browse C:)? [y/N]: " MENU
if [[ "$MENU" =~ ^[Yy]$ ]]; then
    mkdir -p ~/.local/share/applications/wine

    cat <<EOF > ~/.local/share/applications/wine/winecfg.desktop
[Desktop Entry]
Name=Configure Wine
Comment=Change Wine options
Exec=winecfg
Terminal=false
Icon=wine-winecfg
Type=Application
Categories=Wine;
EOF

    cat <<EOF > ~/.local/share/applications/wine/wine-uninstaller.desktop
[Desktop Entry]
Name=Uninstall Wine Software
Comment=Uninstall Windows programs
Exec=wine uninstaller
Terminal=false
Icon=wine-uninstaller
Type=Application
Categories=Wine;
EOF

    cat <<EOF > ~/.local/share/applications/wine/wine-browsedrive.desktop
[Desktop Entry]
Name=Browse C: Drive
Comment=Open virtual C: drive
Exec=wine winebrowser c:
Terminal=false
Icon=folder-wine
Type=Application
Categories=Wine;
EOF

    echo "==> Menu entries created under ~/.local/share/applications/wine/"
fi

echo "==> Setup complete!"
echo "Run winecfg to tweak settings, or winetricks to install components."
