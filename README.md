# Cumann Muscraí BBS

**A Bulletin Board System for the Meshtastic® network.**

Originally based on **TC²-BBS** by **TheCommsChannel**, Cumann Muscraí BBS is a lightweight bulletin board system designed to operate over Meshtastic LoRa mesh networks. It provides local mail, public bulletin boards, channel directories and BBS-to-BBS synchronisation while running continuously on low-power hardware such as the Raspberry Pi.

---

## Features

- 📬 Local mail system
- 📢 Public bulletin boards
- 🔄 BBS-to-BBS bulletin and mail synchronisation
- 📖 Channel directory
- 📊 Network statistics
- 🔋 Wall of Shame (low battery report)
- 🔮 Fortune command
- ⚡ Designed for low-power, always-on operation

---

## Project Goals

Cumann Muscraí BBS aims to provide a reliable bulletin board system for Meshtastic users while remaining:

- Lightweight
- Reliable
- Easy to deploy
- Compatible with existing TC²-BBS networks where practical
- Suitable for unattended Raspberry Pi installations

The project follows a conservative development philosophy: preserve proven functionality while making incremental improvements.

---

## Requirements

- Python 3.x
- Meshtastic Python library
- pypubsub

---

# Installation

## Clone the repository

```bash
cd ~
git clone https://github.com/ei9imb/cumann-muscrai-bbs.git
cd cumann-muscrai-bbs
```

## Create a virtual environment

```bash
python -m venv venv
```

Activate it.

Linux/macOS:

```bash
source venv/bin/activate
```

Windows:

```cmd
venv\Scripts\activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Copy the example configuration:

```bash
cp example_config.ini config.ini
```

---

# Configuration

Edit `config.ini`.

## Interface

For USB connected radios:

```ini
type = serial
```

If multiple radios are attached, specify the serial port.

Example (Linux):

```ini
port = /dev/ttyUSB0
```

Example (Windows):

```ini
port = COM3
```

For TCP connected radios:

```ini
type = tcp
hostname = 192.168.x.x
```

---

## Synchronisation

Configure trusted BBS peers:

```ini
[sync]
bbs_nodes = !f53f4abc,!f3abc123
```

---

# Running

Start the BBS with

```bash
python server.py
```

---

# Running as a Service

A systemd service file is included.

Copy it into place:

```bash
sudo cp mesh-bbs.service /etc/systemd/system/
```

Enable it:

```bash
sudo systemctl enable mesh-bbs.service
```

Start it:

```bash
sudo systemctl start mesh-bbs.service
```

Check status:

```bash
sudo systemctl status mesh-bbs.service
```

View logs:

```bash
journalctl -u mesh-bbs.service -f
```

---

# Radio Configuration

The following Meshtastic device roles are known to work well:

- Client
- Router_Client

---

# Usage

Interact with the BBS by sending a **direct message** to the Meshtastic node connected to the server.

Sending any message displays the main menu.

Reply using the menu letters shown in brackets.

Example:

```
M
```

opens the Mail menu.

---

# Roadmap

Planned improvements include:

- Continued refinement of the user interface
- Improved Raspberry Pi deployment
- Additional administrative tools
- Documentation improvements
- Ongoing optimisation for low-bandwidth LoRa networks

---

# Credits

## Original Project

TC²-BBS by **TheCommsChannel**

This project is derived from TC²-BBS and continues its development under a new identity while acknowledging the original author's work.

## Meshtastic

Thanks to the Meshtastic project and the contributors to the Meshtastic Python examples.

## JS8Call

Thanks to Jordan Sherer for JS8Call and the example API implementation.

---

# License

This project is licensed under the GNU General Public License v3.0.

See the LICENSE file for details.