#!/bin/bash

# Kdenlive Ultimate Setup Script for Arch Linux
# Last updated: 2025-04-08

echo "==> Choose your Kdenlive install method:"
echo "1) pacman (official repo)"
echo "2) flatpak (Flathub, sandboxed)"
read -p "Select 1 or 2: " INSTALL_METHOD

if [[ "$INSTALL_METHOD" == "2" ]]; then
    echo "==> Installing Kdenlive (flatpak)..."
    flatpak install -y flathub org.kde.kdenlive
else
    echo "==> Installing Kdenlive via pacman..."
    sudo pacman -Syu --noconfirm kdenlive
fi

echo "==> Installing recommended video-editing dependencies..."
# Core libraries and effects
sudo pacman -S --noconfirm \
    ffmpeg         `# Video codec support` \
    frei0r-plugins `# Additional video effects` \
    ladspa         `# Audio plugin architecture` \
    lv2            `# More audio plugins` \
    sox            `# Audio processing` \
    dvdauthor      `# DVD authoring (optional)` \
    dvgrab         `# Firewire DV capture` \
    vlc            `# Additional codecs/player (optional)`

echo "==> Installing extra audio tools for advanced mixing..."
sudo pacman -S --noconfirm \
    calf                     `# High-quality audio plugins` \
    mda.lv2                  `# Popular LV2 audio plugin set` \
    qjackctl                `# If you want advanced JACK control` \
    alsa-plugins             `# For extra ALSA features`

# Optional: MLT (Media Lovin' Toolkit) is usually installed as a dependency of Kdenlive
# But if you want the latest MLT or from the git, you can handle it here:
# echo "==> (Optional) Installing MLT from source or AUR..."
# yay -S mlt-git

echo "==> Installing extra transitions/effects (Slideshow, wipes, etc.)..."
sudo pacman -S --noconfirm \
    qt5-multimedia \
    kdelibs \
    breeze-icons \
    gst-plugins-good \
    gst-plugins-bad \
    gst-plugins-ugly \
    gst-libav

# Optional: Kdenlive LUTs or effect packs
echo "==> Downloading Kdenlive effect packs (various LUTs, transitions, etc.)..."
mkdir -p ~/.local/share/kdenlive/luts/
wget -qO /tmp/kdenlive-luts.zip https://files.kde.org/kdenlive/luts/luts-pack.zip
unzip -o /tmp/kdenlive-luts.zip -d ~/.local/share/kdenlive/luts/

echo "==> Installing Title Templates, Wipes, and other resources..."
mkdir -p ~/.local/share/kdenlive/titles/
wget -qO /tmp/kdenlive_titles.zip https://files.kde.org/kdenlive/titletemplates/titletemplates.zip
unzip -o /tmp/kdenlive_titles.zip -d ~/.local/share/kdenlive/titles/

mkdir -p ~/.local/share/kdenlive/wipes/
wget -qO /tmp/kdenlive_wipes.zip https://files.kde.org/kdenlive/wipes/wipes.zip
unzip -o /tmp/kdenlive_wipes.zip -d ~/.local/share/kdenlive/wipes/

echo "==> Optional: Downloading additional Kdenlive transition packs from store.kde.org..."
# Example for one community pack:
mkdir -p ~/.local/share/kdenlive/transitionpacks/
wget -qO /tmp/transition_pack.zip \
    "https://store.kde.org/p/xxxxxx/archive?file=xxxxx"  # Replace with actual link
unzip -o /tmp/transition_pack.zip -d ~/.local/share/kdenlive/transitionpacks/

echo "==> Cleaning up temporary files..."
rm -f /tmp/kdenlive-luts.zip
rm -f /tmp/kdenlive_titles.zip
rm -f /tmp/kdenlive_wipes.zip
rm -f /tmp/transition_pack.zip

echo ""
echo "✅ Kdenlive Ultimate installation complete!"
echo "Launch Kdenlive to enjoy advanced effects, transitions, LUT packs, and more."
echo "Check ~/.local/share/kdenlive for your new wipes, LUTs, and template files."
