# EPItech Coding-Style Tool (`epics`)

A lightweight tool for visualizing entries from the EPItech coding-style guide.

## Installation (not mandatory)

1. Ensure Lua is installed on your device. You can install it using your
package manager.


```bash
sudo [apt/dnf/...] install lua
```

2. Install the tool globally by running:

```bash
sudo ./install.sh
```

This script will:
- Copy all necessary files to the appropriate location.
- Create a symlink, allowing you to execute the tool from any directory.

## Usage

Run the tool by providing the desired section of the coding-style guide as an
argument:

```bash
epics C-O1
```

Replace `C-O1` with the specific section code you want to view.
