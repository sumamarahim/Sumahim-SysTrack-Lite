# 🛡️ Sumahim SysTrack-Lite

> A lightweight Bash-based system activity logger for Linux — track file changes, commands, USB events, and executed programs in real time.

---

## 📌 Overview

**Sumahim SysTrack-Lite** is a simple shell-script-based monitoring tool designed for:

- Cybersecurity learners
- System administrators
- Digital forensics analysts
- Privacy-conscious users

It logs key user and system activities using built-in Linux tools, without heavy dependencies or agents.

---

## 🚀 Features

- ✅ Terminal command logger (with timestamps)
- ✅ Real-time file system activity monitoring (create, modify, move, delete)
- ✅ Program execution logger via auditd
- ✅ USB insertion/removal logger
- ✅ Clean log separation in `/var/log/systrack-lite/`

---

## 📂 Log Directory Structure
> /var/log/systrack-lite/\
> ├── commands.log # Bash command history\
> ├── files.log # File events in monitored directories\
> ├── programs.log # Executed binaries via auditd\
> └── usb.log # USB plug/unplug activity\


---

## 🔧 Tech Stack

| Component       | Tool/Command         |
|----------------|----------------------|
| Language        | Bash (POSIX Shell)   |
| File Monitoring | `inotifywait`        |
| Program Logging | `auditd`, `ausearch` |
| USB Detection   | `udevadm`, `dmesg`   |
| Scheduling      | `cron` or `systemd`  |

---

## 📜 How It Works

1. `setup.sh` installs dependencies and configures `auditd` rules.
2. `systrack.sh` launches background tasks for:
   - File monitoring
   - USB event watching
   - Command logging via `.bashrc`
   - Periodic auditd extraction for executed binaries
3. Logs are written in real time to `/var/log/systrack-lite/`.

---

## 🛠️ Setup

```bash
git clone https://github.com/yourusername/systrack-lite.git
cd systrack-lite
sudo bash setup.sh

```



> ⚠️ You need root privileges for full system monitoring (e.g. auditd, /home access, log writing).

## 📌 Requirements
- Linux (Debian, Ubuntu, Fedora, Arch)
- Bash ≥ 4
### Tools:
- inotify-tools
- auditd
- udevadm
- cron or systemd (optional)

## 🔐 Warning
This tool logs sensitive user activity (commands, files, USB devices). Use it ethically and with explicit permission if monitoring other users.

## 🧪 Future Features
- Real-time CLI dashboard
- Email/SMS alerts on suspicious activity
- Log integrity and encryption
- Lightweight system resource usage tracking
- Web interface for log viewing
















## 🤝 Contribute to Sumahim SysTrack-Lite

We’re building **Sumahim SysTrack-Lite** to help Linux users monitor system activity with a lightweight, open-source approach — no agents, no bloated dashboards.

🚀 Whether you're a beginner in Bash or an experienced security engineer, you can contribute by:

- 🐛 Reporting bugs
- 💡 Suggesting features
- 🛠️ Writing or refactoring scripts
- 📖 Improving documentation
- 🔒 Recommending security enhancements

If you're interested in **cybersecurity**, **Linux internals**, or just love scripting, this is a great way to collaborate.

📢 **First-time contributors welcome!** We follow a friendly and inclusive open-source approach.

> Star 🌟 the repo, fork it, open an issue or PR — your contributions are appreciated!

🔗 [GitHub Repo Link](https://github.com/sumamarahim/sumahim-systrack-lite)






## 📄 License
MIT License — free to use, modify, and distribute.

## 👨‍💻 Author
Made by Sumama — connect with me on [LinkedIn](https://linkedin.com/in/sumama-rahim/) or [GitHub](https://github.com/sumamarahim/)


