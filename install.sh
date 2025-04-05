#!/bin/bash
# 📦 Install script for Arch-Pager CLI

echo "🚀 Installing Arch-Pager CLI..."
INSTALL_DIR="/usr/local/bin"
cp pager $INSTALL_DIR/pager
chmod +x $INSTALL_DIR/pager
echo "✅ 'pager' is now available in your terminal!"
