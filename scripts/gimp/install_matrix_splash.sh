#!/bin/bash
#
# install_matrix_splash.sh
# Installs the Matrix GIMP Splash Screen (for Arch or Flatpak GIMP).
#
# Usage: ./install_matrix_splash.sh
#

echo "==> Installing Matrix GIMP Splash Screen..."

# Set your matrix splash image URL here (placeholder):
MATRIX_SPLASH_URL="https://example.com/matrix_gimp_splash.png"

# Or if you already have the image locally, place it in /tmp:
# cp /path/to/matrix_splash.png /tmp/matrix_splash.png
# MATRIX_SPLASH_URL="/tmp/matrix_splash.png"

# Temporary download folder
mkdir -p /tmp/gimp-matrix-splash
cd /tmp/gimp-matrix-splash

echo "==> Downloading matrix splash image..."
# If you have a real URL:
curl -L "$MATRIX_SPLASH_URL" -o matrix-splash.png

# Prepare directories for pacman or flatpak install
PACMAN_SPLASH_DIR="$HOME/.config/GIMP/2.10/splashes"
FLATPAK_SPLASH_DIR="$HOME/.var/app/org.gimp.GIMP/config/GIMP/2.10/splashes"

# Create the directories if they don't exist
mkdir -p "$PACMAN_SPLASH_DIR"
mkdir -p "$FLATPAK_SPLASH_DIR"

# Copy splash image to both possible locations
echo "==> Copying matrix splash to: $PACMAN_SPLASH_DIR"
cp matrix-splash.png "$PACMAN_SPLASH_DIR/gimp-splash.png"

echo "==> Copying matrix splash to: $FLATPAK_SPLASH_DIR"
cp matrix-splash.png "$FLATPAK_SPLASH_DIR/gimp-splash.png"

echo "==> Matrix GIMP Splash Screen installed!"
echo "==> For pacman-based GIMP, the file is located in: $PACMAN_SPLASH_DIR"
echo "==> For Flatpak GIMP, the file is located in: $FLATPAK_SPLASH_DIR"
echo "==> Relaunch GIMP to see the new splash screen."
