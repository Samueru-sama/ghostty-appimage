<h1><p align="center">
  <img src="./assets/ghostty.png" alt="Ghostty Logo" width="128">
  <img src="./assets/appimage.png" alt="AppImage Logo" width="128">
  <br>Ghostty AppImage<br>
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License: MIT">
  <img src="https://img.shields.io/github/forks/psadi/ghostty-appimage" alt="Forks">
  <img src="https://img.shields.io/github/stars/psadi/ghostty-appimage" alt="Stars">
  <img src="https://github.com/psadi/ghostty-appimage/actions/workflows/ci.yaml/badge.svg" alt="Build Status">
  <img src="https://img.shields.io/github/issues/psadi/ghostty-appimage" alt="Open Issues">
  <img src="https://img.shields.io/github/issues-pr/psadi/ghostty-appimage" alt="Pull Requests">
  <br>
  <img src="https://img.shields.io/github/downloads/psadi/ghostty-appimage/total" alt="GitHub Downloads (all assets, all releases)">
  <img src="https://img.shields.io/github/downloads/psadi/ghostty-appimage/latest/total" alt="GitHub Downloads (all assets, latest release)">
  <img src="https://img.shields.io/github/v/release/psadi/ghostty-appimage" alt="GitHub Release">
  <img src="https://img.shields.io/github/release-date/psadi/ghostty-appimage" alt="GitHub Release Date">
  <img src="https://img.shields.io/github/contributors/psadi/ghostty-appimage" alt="Contributors">
</p></h1>

This repository provides build scripts to create a Universal AppImage for [Ghostty](https://ghostty.org/). This unofficial build offers an executable AppImage compatible with any Linux distribution.

**Ghostty Source Code:** [Click Here](https://github.com/ghostty-org/ghostty)

## 🚀 Quick Start

1. Download the latest AppImage from the [releases](https://github.com/psadi/ghostty-appimage/releases) section.
2. Follow the installation instructions below to run the AppImage.

## ⚙️ Installation

### Command Line (Manual)

Run the following commands in your terminal:

```bash
# Download the latest AppImage package from releases
wget https://github.com/psadi/ghostty-appimage/releases/download/${VERSION}/Ghostty-${VERSION}-${ARCH}.AppImage

# Make the AppImage executable
chmod +x Ghostty-${VERSION}-${ARCH}.AppImage

# Run the AppImage
./Ghostty-${VERSION}-${ARCH}.AppImage

# Optionally, add the AppImage to your PATH for easier access

# With sudo for system wide availability
sudo install ./Ghostty-${VERSION}-${ARCH}.AppImage /usr/local/bin/ghostty

# Without sudo, XDG base spec mandate
install ./Ghostty-${VERSION}-${ARCH}.AppImage $HOME/.local/bin/ghostty

# Now you can run Ghostty from anywhere using the command:
# ghostty
```

**Note:** By using [**AM**](https://github.com/ivan-hc/AM)/[**AppMan**](https://github.com/ivan-hc/AppMan), **PATH** config done automatically when you install appimages with it.

### Command Line (Auto)

Ghostty AppImage is also available via [**Soar**](https://github.com/pkgforge/soar) which automatically handles the install, upgrade and desktop integration process

```bash
# Install
soar install ghostty

# Upgrade
soar update ghostty

# Uninstall
soar remove ghostty
```

### Graphical

1. Download the latest AppImage package from the [releases](https://github.com/psadi/ghostty-appimage/releases) section.
2. Locate the downloaded file in your file explorer (e.g., Nautilus, Thunar, PCManFM).
3. Right-click the downloaded file and select **Properties**.
4. Navigate to the **Permissions** tab and check the box that says **Allow executing file as program/Executable as Program**.
5. Close the properties window and double-click the AppImage file to run it.

<p align="center">
  <img src="./assets/1.png" alt="Step 1" width="384" style="margin-right: 10px;">
  <img src="./assets/2.png" alt="Step 2" width="384">
</p>

## ⏫ Updating

Since AppImages are self-contained executables, there is no formal installation process beyond setting executable permissions.

**Update manually:**

1. Download the latest AppImage package from the [releases](https://github.com/psadi/ghostty-appimage/releases) section.
1. Follow the same steps as in the [Installation](#installation) section to make it executable and run it.

**Update automatically:**

1. Use [AppImageUpdate](https://github.com/AppImageCommunity/AppImageUpdate) which reads the update information in the AppImage. This is a low level tool.
1. Use a higher level tool that uses AppImageUpdate, like [AM](https://github.com/ivan-hc/AM) or [appimaged](https://github.com/probonopd/go-appimage/blob/master/src/appimaged/README.md) daemon, these tools also automatically handle desktop integration.

## 🖥️ Supported System Architectures

This AppImage supports the following architectures:

| **#** | **Architecture** | **Status** | **Availability** |
| :---: | ---------------- | :--------: | ---------------- |
|   1   | x86_64           |     🟢     | Available        |
|   2   | aarch64          |     🟢     | Available        |

**Notes:**

- **x86_64**: Widely used in modern desktops and servers, supporting 64-bit processing.
- **aarch64**: 64-bit ARM architecture, planned for future support in cloud computing environments.

### 🛠️ Troubleshooting

**Known Issues**

1. **Failed to create EGL Display**

   **Fix (Interim):** Fallback to x11 backend by running the AppImage from one of the below following options,

   ```bash
   # Option 1
   ❯ GDK_BACKEND=x11 ./Ghostty-${VERSION}-${ARCH}.AppImage

   # Option 2
   ❯ export GDK_BACKEND=x11
   ❯ ./Ghostty-${VERSION}-${ARCH}.AppImage

   # Option 3: Add `export GDK_BACKEND=x11` to your .bashrc or .zshrc and launch the appimage normally
   ```

1. **[TERMINFO](https://ghostty.org/docs/help/terminfo) `xterm-ghostty` not-set/breaks functionality**

   **Fix:** Set the TERMINFO value to `xterm-256color` at runtime by running the AppImage as follows,

   ```bash
   # Option 1
   ❯ TERM=xterm-256color ./Ghostty-${VERSION}-${ARCH}.AppImage

   # Option 2: Add `export TERM=xterm-256color` to your .bashrc or .zshrc and launch the appimage normally
   ```

_If you encounter any errors, check the terminal for error messages that may indicate missing dependencies or other issues_

## 🤝 Contributing

Contributions & Bugfixes are welcome. If you like to contribute, please feel free to fork the repository and submit a pull request.

For any questions or discussions, please open an issue in the repository.
