#!/bin/bash

# Uninstall Wine and clean system (Arch Linux)
# Last updated: 2025-04-07

echo "==> Uninstalling Wine and related packages..."
sudo pacman -Rns --noconfirm wine-staging wine wine-mono wine-gecko winetricks \
    lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-pipewire pipewire-pulse \
    lib32-libcups lib32-mesa lib32-vulkan-icd-loader \
    lib32-gnutls lib32-sdl2 lib32-gst-plugins-base lib32-gst-plugins-good lib32-gst-libav

echo "==> Removing common Wine prefixes..."
rm -rf ~/.wine ~/.wine32 ~/.wine64

read -p "Remove sandbox Wine user 'wineuser'? [y/N]: " DELUSER
if [[ "$DELUSER" =~ ^[Yy]$ ]]; then
    sudo userdel -r wineuser 2>/dev/null || echo "User may already be removed."
fi

echo "==> Removing Wine menu entries and icons..."
rm -f ~/.local/share/applications/wine-*.desktop
rm -rf ~/.local/share/applications/wine/
rm -rf ~/.local/share/icons/hicolor/*/*/application-x-wine-extension*
rm -f ~/.local/share/mime/packages/x-wine*
rm -f ~/.local/share/mime/application/x-wine-extension*
rm -f ~/.local/share/applications/mimeinfo.cache

echo "==> Cleaning up wine MIME type and desktop caches..."
update-desktop-database ~/.local/share/applications/
update-mime-database ~/.local/share/mime/

echo "==> Wine has been fully removed from your system."
