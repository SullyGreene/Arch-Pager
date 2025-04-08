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

# Install Resynthesizer plugin
echo "==> Installing Resynthesizer..."
mkdir -p ~/.config/gimp/2.10/plug-ins/
mkdir -p ~/.config/gimp/2.10/scripts/
git clone https://github.com/bootchk/resynthesizer.git /tmp/resynthesizer
cp /tmp/resynthesizer/resynthesizer/*.py ~/.config/gimp/2.10/plug-ins/
cp /tmp/resynthesizer/plugin/*.scm ~/.config/gimp/2.10/scripts/
chmod +x ~/.config/gimp/2.10/plug-ins/*.py

# Install Layer Effects plugin
echo "==> Installing Layer Effects plugin..."
git clone https://github.com/jimhol/layerfx.git /tmp/layerfx
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

# Install custom GIMP themes
echo "==> Installing custom GIMP themes..."
mkdir -p ~/.config/gimp/2.10/themes/

# Example 1: Photoshop Grey Theme
git clone https://github.com/DiegoCarrasco/GIMP-Photoshop-Theme.git /tmp/gimp-ps-theme
cp -r /tmp/gimp-ps-theme/Photoshop_GIMP_theme ~/.config/gimp/2.10/themes/

# Example 2: Flat GIMP Dark Theme
git clone https://github.com/aferrero2707/gimp-thermal-themes.git /tmp/gimp-flat-themes
cp -r /tmp/gimp-flat-themes/themes/* ~/.config/gimp/2.10/themes/

# Optional: Set default theme by modifying gtkrc (or do it in GIMP’s preferences)
echo "To apply a theme, open GIMP and go to Edit > Preferences > Interface > Theme."

# Install FX Foundry (photo effects scripts)
echo "==> Installing FX Foundry..."
mkdir -p ~/.config/gimp/2.10/scripts/
git clone https://github.com/LinuxBeaver/FX-Foundry /tmp/fxfoundry
cp /tmp/fxfoundry/fx-foundry.scm ~/.config/gimp/2.10/scripts/

# GIMP-ML (AI filters)
echo "==> Installing GIMP-ML for AI filters (super-resolution, colorize, etc.)..."
sudo pacman -S --noconfirm python-pyqt5 python-pillow python-scipy python-numpy python-opencv
pip install --user torch torchvision
git clone https://github.com/kritiksoman/GIMP-ML.git /tmp/gimp-ml
cp -r /tmp/gimp-ml/gimp-plugins/* ~/.config/gimp/2.10/plug-ins/
chmod -R +x ~/.config/gimp/2.10/plug-ins/

# Isometric grid & pixel tools
echo "==> Adding Isometric Grid and Pixel Tools..."
mkdir -p ~/.config/gimp/2.10/patterns/ ~/.config/gimp/2.10/gradients/
curl -L https://raw.githubusercontent.com/jessemillar/isogrid-gimp/master/isogrid.pat \
     -o ~/.config/gimp/2.10/patterns/isogrid.pat
curl -L https://raw.githubusercontent.com/DrSlony/pixel-art-gimp-setup/master/pixel.ggr \
     -o ~/.config/gimp/2.10/gradients/pixel.ggr

# Export Layers plugin
echo "==> Installing Export Layers plugin..."
git clone https://github.com/khalim19/gimp-plugin-export-layers.git /tmp/export-layers
mkdir -p ~/.config/gimp/2.10/plug-ins/export-layers/
cp -r /tmp/export-layers/export_layers.py ~/.config/gimp/2.10/plug-ins/export-layers/
chmod +x ~/.config/gimp/2.10/plug-ins/export-layers/export_layers.py

# Vapor/Retro brushes
echo "==> Downloading retro/vapor brushes..."
curl -L https://github.com/ctrl-alt-del-world/vapor-gimp-kit/archive/refs/heads/main.zip \
     -o /tmp/vaporkit.zip
unzip /tmp/vaporkit.zip -d /tmp/
cp -r /tmp/vapor-gimp-kit*/brushes/* ~/.config/gimp/2.10/brushes/

# Extra brushes, gradients, scripts
echo "==> Downloading extra resources (brushes, gradients, scripts)..."
curl -L https://github.com/aferrero2707/gimp-plugins-collection/archive/refs/heads/master.zip \
     -o /tmp/gimp-extras.zip
unzip /tmp/gimp-extras.zip -d /tmp/
cp -r /tmp/gimp-plugins-collection*/resources/* ~/.config/gimp/2.10/

echo " "
echo "✅ GIMP Ultimate installation complete!"
echo "Launch GIMP and explore all new plugins in Filters, Layers, and Script-Fu menus."
