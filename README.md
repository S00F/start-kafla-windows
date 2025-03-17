# Windows Terminal Batch Script Automation

This project provides a batch script that automates the execution of two scripts in separate **Windows Terminal** tabs while ensuring that a specific port is freed before execution.

## 🚀 Features

- **Kills any process running on a specified port** before starting.
- **Opens two named tabs** in Windows Terminal.
- **Runs two scripts (`script.bat` and `script2.bat`) sequentially**.
- **Adds a delay** before running the second script.
- **Keeps both terminal tabs open** to monitor logs.

---

## 🛠️ Setup & Usage

### 1️⃣ **Modify Configuration in `run_script.bat`**

Before running the script, customize these variables inside `run_script.bat`:

```bat
set "TARGET_FOLDER=C:\path\to\your\folder"   :: Change to your script folder
set "DELAY=5"   :: Delay (in seconds) before running script 2
set "PORT=8080" :: Define the port to kill processes on
```
