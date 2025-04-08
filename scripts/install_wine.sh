#!/bin/bash

# Wine Installer Script for Arch Linux with 32-bit or 64-bit prefix option
# Last updated: 2025-04-07

echo "==> Updating system..."
sudo pacman -Syu --noconfirm

echo "==> Enabling multilib (if not already enabled)..."
if ! grep -q "\[multilib\]" /etc/pacman.conf; then
    echo "==> Enabling multilib repo in /etc/pacman.conf..."
    sudo sed -i '/#\[multilib\]/,/#Include = \/etc\/pacman.d\/mirrorlist/ s/#//' /etc/pacman.conf
    sudo pacman -Syy
fi

echo "==> Installing Wine Staging + Tools..."
sudo pacman -S --noconfirm wine-staging wine-mono wine-gecko winetricks

echo "==> Installing audio dependencies..."
sudo pacman -S --noconfirm \
    lib32-alsa-lib \
    lib32-alsa-plugins \
    lib32-libpulse \
    lib32-pipewire \
    pipewire-pulse \
    lib32-libcups

echo "==> Installing 32-bit graphics libraries..."
sudo pacman -S --noconfirm lib32-mesa lib32-vulkan-icd-loader

echo "==> Installing optional gaming/media libs..."
sudo pacman -S --noconfirm \
    lib32-gnutls \
    lib32-sdl2 \
    lib32-gst-plugins-base \
    lib32-gst-plugins-good \
    lib32-gst-libav

read -p "Do you want a 32-bit or 64-bit Wine prefix? [32/64]: " WINEBITS
if [[ "$WINEBITS" == "32" ]]; then
    export WINEARCH=win32
    export WINEPREFIX="$HOME/.wine32"
    echo "==> Setting up 32-bit Wine prefix at $WINEPREFIX..."
else
    export WINEARCH=win64
    export WINEPREFIX="$HOME/.wine64"
    echo "==> Setting up 64-bit Wine prefix at $WINEPREFIX..."
fi

wineboot -u
winecfg

echo "==> Wine prefix created: $WINEPREFIX"
echo "==> You can now install apps with:"
echo "    WINEPREFIX=$WINEPREFIX wine setup.exe"
echo "    WINEPREFIX=$WINEPREFIX winetricks"

