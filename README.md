# 📟 Arch-Pager

> 🚀 A CLI-powered script launcher and system updater for Arch Linux. Just type `pager` and go! 🧙‍♂️

---

## 🧰 What is Arch-Pager?

**Arch-Pager** is a terminal-first, script-based toolkit that lets you run essential commands through a simple interface. Launch it by typing `pager` and unlock powerful tools like:

- 🔄 `pager update` – Pull the latest Bash scripts from GitHub.
- 🧼 `pager update-system` – Fully update your Arch Linux system.
- 📁 Modular `/scripts` folder with custom tools.
- 🧙 Add your own aliases and enhancements.

---

## 🚀 Quick Install

> **📌 IMPORTANT:** You must clone the repo before running the install script.

```bash
git clone https://github.com/SullyGreene/Arch-Pager.git
cd Arch-Pager
sudo bash install.sh
```

Once installed, just run:

```bash
pager
```

This will unlock all available commands and scripts!

---

## 🔧 Commands

| Command                  | Description                                 |
|--------------------------|---------------------------------------------|
| `pager`                  | Launch help/interface                       |
| `pager update`           | Pull latest Bash scripts from GitHub        |
| `pager update-system`    | Fully update Arch system via pacman         |
| `pager clean_cache`      | Clear pacman’s package cache 🧽             |
| `pager remove_orphans`   | Remove unneeded orphaned packages 🗑         |
| `pager pkg_info`         | Show installed packages sorted by size 📦    |
| `pager mirror_speed`     | Refresh mirrors for best download speeds ⚡  |
| `pager aur_helper`       | Install or update AUR helper 🧙              |
| `pager service_manager`  | Start/stop/enable/disable systemd services 🔧|
| `pager disk_usage`       | Visualize disk space with `ncdu` 💾         |
| `pager sys_info`         | Show system summary with neofetch 🖥️        |
| `pager custom_aliases`   | Load your own aliases 🎩                    |

---

## 🗂 Folder Structure

```
Arch-Pager/
├── install.sh              # 📦 Installer script
├── pager                   # 🎛️ CLI launcher
├── scripts/                # ⚙️ Modular tools
│   ├── update.sh
│   ├── update_system.sh
│   └── [...more scripts]
├── docs/                   # 📘 Script documentation
│   └── clean_cache.md
```

---

## 🪪 License

Licensed under the **MIT License** – fork it, use it, remix it, build your own wizardry! 🧙‍♀️

---

## 🧙‍♂️ Made with 💖 by [Sully Greene](https://github.com/SullyGreene)

---

💡 **Pro Tip:** Add your favorite tools to `scripts/` and document them in `docs/` — build your own magical CLI suite!
