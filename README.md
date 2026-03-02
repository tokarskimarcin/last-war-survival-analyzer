# 🛡️ Last War: Alliance Analyzer (BlueStacks Edition)
An automated tool designed to track Alliance Power growth and VS Point performance in The Last War: Survival. This application captures game data via ADB, processes it using OCR, and syncs everything directly to a Google Sheet for long-term analysis.

## 🚀 Features

- Non-Intrusive Scanning: Uses ADB (Android Debug Bridge) to interact with BlueStacks without hijacking your mouse cursor.
- OCR Data Extraction: Automatically reads Player Names, Power, and VS Points from screenshots.
- Google Sheets Integration: Real-time data logging for easy sharing with Alliance R4/R5 leadership.
- Modern UI: Built with CustomTkinter featuring a Dark Mode dashboard, live status tracking, and a debug console.
- Docker Ready: Environment-isolated execution to avoid "it works on my machine" issues.

## 🛠️ Prerequisites

1. **BlueStacks**: Installed and running on Windows.
1. **ADB Enabled**: * Go to BlueStacks Settings > Advanced.
    - Toggle ON "Android Debug Bridge (ADB)".
    - Note the port (usually 5555).
2. Google Cloud Credentials:
    - A `service_account.json` file from the Google Cloud Console with access to the Sheets API.

## 📁 Project Structure

```Plaintext
├── app/
│   ├── main.py            # CustomTkinter UI & Logic
│   ├── ocr_engine.py      # Image processing (Tesseract/EasyOCR)
│   ├── gsheets.py         # Google Sheets API wrapper
│   └── requirements.txt   # Python dependencies
├── screenshots/           # Temporary folder for scan captures
├── Dockerfile             # Container configuration
└── docker-compose.yml     # Orchestration for host-to-container ADB
```

## 📥 Installation & Setup

**Option A: Running with Docker (Recommended)**

1. Clone this repository.
2. Place your `service_account.json` in the /app folder.
3. Run the container:

```Bash
docker-compose up --build
```
**Option B: Local Installation**

1. Install Python 3.11+.
2. Install dependencies:

```Bash
pip install -r app/requirements.txt
```
3. Ensure ADB is in your System PATH.
4. Run the app:

```Bash
python app/main.py
```

## 🎮 How to Use

1. **Connect**: Open BlueStacks and ensure the game is on the main screen.
2. **Configure**: Paste your Google Sheet ID into the UI settings field.
3. **Start**: Click START ANALYZER.
    - The bot will automatically navigate to the Alliance Member list.
    - It will scroll, capture screenshots, and parse data.
4. **Monitor**: Check the built-in Console for real-time logs and debug info.

## ⚠️ Disclaimer

This tool is intended for personal/alliance management use. Automated interaction with the game may violate the game's Terms of Service. Use at your own risk and always include "human-like" delays in your settings.

📝 To-Do

- [ ] Implement random delay intervals to mimic human scrolling.
- [ ] Add automatic "Back" button detection if a player profile is accidentally clicked.
- [ ] Support for multiple Alliance tabs (Power vs. Kill Rank).