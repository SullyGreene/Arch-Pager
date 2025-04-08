#!/bin/bash

# GIMP Ultimate Setup Script for Arch Linux
# Last updated: 2025-04-07

echo "==> Choose your GIMP install method:"
echo "1) pacman (official repo)"
echo "2) flatpak (Flathub, sandboxed)"
read -p "Select 1 or 2: " INSTALL_METHOD

if [[ "$INSTALL_METHOD" == "2" ]]; then
    echo "==> Installing GIMP (flatpak)..."
    flatpak install -y flathub org.gimp.GIMP
else
    echo "==> Installing GIMP via pacman..."
    sudo pacman -Syu --noconfirm gimp
fi

echo "==> Installing plugin dependencies..."
sudo pacman -S --noconfirm git python-pip libgimp gimp-python

# Install G'MIC
echo "==> Installing G'MIC plugin..."
sudo pacman -S --noconfirm gmic gimp-plugin-gmic

# Install Resynthesizer
echo "==> Installing Resynthesizer..."
mkdir -p ~/.config/gimp/2.10/plug-ins/
git clone https://github.com/bootchk/resynthesizer.git /tmp/resynthesizer
cp /tmp/resynthesizer/*.py /tmp/resynthesizer/*.scm ~/.config/gimp/2.10/plug-ins/
chmod +x ~/.config/gimp/2.10/plug-ins/*

# Install Layer Effects
echo "==> Installing Layer Effects plugin..."
git clone https://github.com/jimhol/compsop.git /tmp/layerfx
cp /tmp/layerfx/layerfx.py ~/.config/gimp/2.10/plug-ins/
chmod +x ~/.config/gimp/2.10/plug-ins/layerfx.py

# Install Beautify plugin
echo "==> Installing Beautify plugin..."
git clone https://github.com/hejiann/beautify.git /tmp/beautify
cp -r /tmp/beautify/* ~/.config/gimp/2.10/plug-ins/
chmod -R +x ~/.config/gimp/2.10/plug-ins/

# Install BIMP (Batch Image Manipulation Plugin)
echo "==> Installing BIMP..."
git clone https://github.com/alessandrofrancesconi/gimp-plugin-bimp.git /tmp/bimp
cd /tmp/bimp
make && sudo make install

# Optional: Add custom brushes/scripts
echo "==> Downloading extra resources (brushes, gradients, scripts)..."
mkdir -p ~/.config/gimp/2.10/{scripts,brushes,gradients}
curl -L https://github.com/aferrero2707/gimp-plugins-collection/archive/refs/heads/master.zip -o /tmp/gimp-extras.zip
unzip /tmp/gimp-extras.zip -d /tmp/
cp -r /tmp/gimp-plugins-collection*/resources/* ~/.config/gimp/2.10/

echo "✅ GIMP Ultimate installation complete!"
echo "Launch GIMP and explore all new plugins in Filters, Layers, and Script-Fu menus."
