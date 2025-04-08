# Install Better GIMP Splash Screen
echo "==> Installing Better GIMP Splash Screen..."
mkdir -p /tmp/gimp-splash
git clone https://github.com/comethrusws/GIMPSplashScreen.git /tmp/gimp-splash

# Ask user for Splash preference
echo "==> Choose your preferred splash image shape:"
echo "1) Rounded"
echo "2) Square"
read -p "Select 1 or 2: " SPLASH_CHOICE

SPLASH_IMG="Rounded/gimp-splash.png"
if [[ "$SPLASH_CHOICE" == "2" ]]; then
    SPLASH_IMG="Square/gimp-splash.png"
fi

# Prepare directories for pacman or flatpak install
PACMAN_SPLASH_DIR="$HOME/.config/GIMP/2.10/splashes"
FLATPAK_SPLASH_DIR="$HOME/.var/app/org.gimp.GIMP/config/GIMP/2.10/splashes"

# Create the directories if they don’t exist
mkdir -p "$PACMAN_SPLASH_DIR"
mkdir -p "$FLATPAK_SPLASH_DIR"

# Copy splash to both possible locations
cp "/tmp/gimp-splash/$SPLASH_IMG" "$PACMAN_SPLASH_DIR/"
cp "/tmp/gimp-splash/$SPLASH_IMG" "$FLATPAK_SPLASH_DIR/"

echo "==> Better GIMP Splash Screen installed!"
echo "==> If using a Flatpak GIMP, the splash is placed in:"
echo "    $FLATPAK_SPLASH_DIR"
echo "==> If using pacman GIMP, the splash is placed in:"
echo "    $PACMAN_SPLASH_DIR"
echo "==> Relaunch GIMP to see the new splash screen."
