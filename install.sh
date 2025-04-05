#!/bin/bash
# 📦 Bulletproof Arch-Pager Installer by Sully Greene

set -e

INSTALL_BIN="/usr/local/bin"
INSTALL_DIR="/usr/local/share/arch-pager"
PAGER_FILE="pager"
SCRIPTS_DIR="scripts"

echo "🚀 Starting Arch-Pager Installation..."

# 🔐 Elevate if not root
if [ "$EUID" -ne 0 ]; then
  echo "⚠️  Please run this installer as root (restarting with sudo...)"
  exec sudo bash "$0" "$@"
fi

# 🔍 Validate files
if [ ! -f "$PAGER_FILE" ]; then
  echo "❌ Missing '$PAGER_FILE' in current directory."
  exit 1
fi

if [ ! -d "$SCRIPTS_DIR" ]; then
  echo "❌ Missing '$SCRIPTS_DIR/' directory with tools."
  exit 1
fi

# 🧼 Clean previous installs
echo "🧹 Cleaning old installs (if any)..."
rm -f "$INSTALL_BIN/pager"
rm -rf "$INSTALL_DIR"

# 🛠 Create install directories
echo "📁 Setting up in: $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

# 🚚 Copy scripts
echo "📂 Copying $SCRIPTS_DIR to $INSTALL_DIR..."
cp -r "$SCRIPTS_DIR" "$INSTALL_DIR/"

# 🔧 Make all scripts executable
chmod +x "$INSTALL_DIR/scripts/"*.sh

# 🚀 Install launcher
echo "🔗 Linking CLI: $PAGER_FILE -> $INSTALL_BIN/pager"
cp "$PAGER_FILE" "$INSTALL_BIN/pager"
chmod +x "$INSTALL_BIN/pager"

# ✅ Done
echo "✅ Arch-Pager CLI installed successfully!"
echo "🧙 Type 'pager' in your terminal to begin your command-line wizardry!"

# 🧪 Optional test
read -p "👉 Would you like to run 'pager' now? (y/N): " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
  pager
fi
