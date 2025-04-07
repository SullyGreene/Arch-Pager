#!/bin/bash

# Wine Installer Script for Arch Linux
# Last updated: 2025-04-07

echo "==> Updating system..."
sudo pacman -Syu --noconfirm

echo "==> Enabling multilib (if not already enabled)..."
if ! grep -q "\[multilib\]" /etc/pacman.conf; then
    sudo sed -i '/#\[multilib\]/,/#Include = \/etc\/pacman.d\/mirrorlist/ s/#//' /etc/pacman.conf
    sudo pacman -Syy
fi

echo "==> Installing Wine (staging version)..."
sudo pacman -S --noconfirm wine-staging wine-mono wine-gecko winetricks

echo "==> Installing audio support packages..."
sudo pacman -S --noconfirm \
    lib32-alsa-lib \
    lib32-alsa-plugins \
    lib32-libpulse \
    lib32-pipewire \
    pipewire-pulse \
    lib32-libcups

echo "==> Installing graphics driver libraries (multilib)..."
# You can customize this based on your GPU
sudo pacman -S --noconfirm lib32-mesa lib32-vulkan-icd-loader

echo "==> Installing optional packages for gaming/media..."
sudo pacman -S --noconfirm \
    lib32-gnutls \
    lib32-sdl2 \
    lib32-gst-plugins-base \
    lib32-gst-plugins-good \
    lib32-gst-libav

echo "==> Optional: Install DXVK and VKD3D-Proton (for Vulkan-based DirectX)..."
yay -S --noconfirm dxvk-bin vkd3d-proton-bin

echo "==> Done. You can now configure Wine using:"
echo "    winecfg"
echo "    winetricks"

echo "==> Example to create a new 32-bit prefix:"
echo "    WINEARCH=win32 WINEPREFIX=~/.wine32 winecfg"

