#!/bin/bash
# 🔄 Script to update scripts directory from GitHub

echo "📡 Pulling latest script updates..."
cd "$(dirname "$0")/.."
git pull origin main
echo "✅ Scripts updated."
