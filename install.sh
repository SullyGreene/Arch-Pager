#!/bin/bash
# 📦 Advanced Install Script for Arch-Pager CLI

set -e  # Exit immediately if a command exits with a non-zero status

INSTALL_DIR="/usr/local/bin"
PAGER_NAME="pager"
SCRIPT_NAME="$(basename "$0")"

echo "🚀 Starting Arch-Pager Installation..."

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "❌ Please run this installer as root (e.g., using sudo)."
  exit 1
fi

# Ensure pager script exists
if [ ! -f "$PAGER_NAME" ]; then
  echo "❌ Cannot find '$PAGER_NAME' script in current directory. Make sure you're in the project root."
  exit 1
fi

# Make sure scripts directory exists
if [ ! -d "scripts" ]; then
  echo "❌ Missing 'scripts/' directory. Installation aborted."
  exit 1
fi

# Copy pager to /usr/local/bin
echo "📂 Copying '$PAGER_NAME' to $INSTALL_DIR ..."
cp "$PAGER_NAME" "$INSTALL_DIR/$PAGER_NAME"
chmod +x "$INSTALL_DIR/$PAGER_NAME"

# Make scripts executable
echo "🔧 Making scripts executable..."
chmod +x scripts/*.sh

echo "✅ Arch-Pager CLI installed!"
echo "💡 You can now run 'pager' from anywhere in your terminal."

# Optional post-install test
read -p "👉 Would you like to test it now? (y/N): " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
  "$INSTALL_DIR/$PAGER_NAME"
fi
