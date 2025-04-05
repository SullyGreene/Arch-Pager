# 📟 Arch-Pager

> 🚀 A CLI-powered script launcher and system updater for Arch Linux. Just type `pager` and go! 🧙‍♂️

---

## 🧰 What is Arch-Pager?

**Arch-Pager** is a terminal-first, script-based tool that lets you run essential commands through a simple interface. Launch it by typing `pager` and gain access to helpful options like:

- 🔄 `pager update` – Pull the latest Bash scripts from GitHub.
- 🧼 `pager update-system` – Fully update your Arch Linux system.
- 📁 Custom scripts directory to expand your toolkit.

---

## 🚀 Quick Install

```bash
curl -s https://raw.githubusercontent.com/SullyGreene/Arch-Pager/main/install.sh | bash
```

Once installed, just run:

```bash
pager
```

---

## 🔧 Commands

| Command                 | Description                            |
|------------------------|----------------------------------------|
| `pager`                | Launch the interface/help              |
| `pager update`         | Updates the scripts from GitHub        |
| `pager update-system`  | Full Arch system update via pacman     |

---

## 🗂 Folder Structure

```
Arch-Pager/
├── install.sh          # Installer script
├── pager               # The main CLI entry point
├── scripts/            # All available bash scripts
│   ├── update.sh
│   └── update_system.sh
```

---

## 🪪 License

This project is licensed under the MIT License – feel free to use, fork, and remix it!

---

## 🧙‍♂️ Made with 💖 by [Sully Greene](https://github.com/SullyGreene)
