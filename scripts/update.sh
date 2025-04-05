#!/bin/bash
# 🔄 Smart Script Updater for Arch-Pager

SCRIPTS_DIR="/usr/local/share/arch-pager/scripts"
REPO_URL="https://raw.githubusercontent.com/SullyGreene/Arch-Pager/main/scripts"

echo "📡 Updating Arch-Pager scripts..."

# If in a Git repo, pull updates
if [ -d ".git" ]; then
  echo "📦 Git repo detected. Pulling updates..."
  git pull origin main
else
  echo "🌐 Not a Git repo — downloading scripts from GitHub..."

  # List of script files to update
  SCRIPT_NAMES=(
    update.sh
    update_system.sh
    clean_cache.sh
    remove_orphans.sh
    pkg_info.sh
    mirror_speed.sh
    aur_helper.sh
    service_manager.sh
    disk_usage.sh
    sys_info.sh
    custom_aliases.sh
  )

  for script in "${SCRIPT_NAMES[@]}"; do
    echo "⬇️  Updating $script..."
    curl -s "$REPO_URL/$script" -o "$SCRIPTS_DIR/$script"
    chmod +x "$SCRIPTS_DIR/$script"
  done
fi

echo "✅ Scripts updated successfully!"
