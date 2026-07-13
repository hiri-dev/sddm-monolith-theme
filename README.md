# 🏛️ Monolith SDDM Theme

A clean, pixel-perfect, and ultra-minimalist monochrome theme for SDDM. Designed with absolute symmetry, clean typography, and a modern layout.

> [!NOTE]
> This theme is fully compatible with both **X11** and **Wayland** sessions, including GNOME, KDE Plasma, and Hyprland. All legacy rendering bugs and shader crashes under Wayland have been fully fixed.

---

## ✨ Features
- **Pure Dark Monochrome Aesthetic:** Deep `#060608` background with sleek contrast borders.
- **Symmetric Architecture:** Perfectly aligned clock, user details, and system controls.
- **Smart Username Autopopulation:** Falls back to the default system user if the session history is empty.
- **Robust Session Selector:** Built-in drop-down panel with a custom monitor icon.
- **Adaptive System Controls:** Power, Reboot, and Sleep buttons automatically show or hide based on your hardware capabilities.

---

## 📸 Preview
![Theme Screenshot](preview.png?v=202607132223)

---

## 🚀 Installation & Setup

### Step 1: Clone and Copy the Theme
Copy the theme folder into your system's SDDM themes directory:
```bash
sudo cp -r sddm-monolith /usr/share/sddm/themes/
```

### Step 2: Enable the Theme
Edit `/etc/sddm.conf` (or create a file like `/etc/sddm.conf.d/theme.conf`):
```ini
[Theme]
Current=sddm-monolith
```

---

## 📦 OS-Specific Dependency Guides

To ensure all elements (icons, inputs, layout animations) render correctly, install the dependencies for your distribution:

### 🔹 Arch Linux
```bash
sudo pacman -S qt5-quickcontrols2 qt5-graphicaleffects qt5-svg
```

### 🔹 Fedora
```bash
sudo dnf install qt5-qtquickcontrols2 qt5-qtgraphicaleffects qt5-qtsvg
```

### 🔹 Ubuntu / Debian
```bash
sudo apt install qml-module-qtquick-controls2 qml-module-qtgraphicaleffects qml-module-qtquick-layouts qml-module-qtquick-templates2
```

### 🔹 openSUSE
```bash
sudo zypper in libqt5-qtquickcontrols2 libqt5-qtgraphicaleffects libqt5-qtsvg
```

### 🔹 NixOS
To package the theme on NixOS, you can add it to your system configuration using this pattern:
```nix
environment.systemPackages = [
  (pkgs.stdenv.mkDerivation {
    name = "sddm-monolith-theme";
    src = ./sddm-monolith; # Path to your theme folder
    installPhase = ''
      mkdir -p $out/share/sddm/themes/sddm-monolith
      cp -r * $out/share/sddm/themes/sddm-monolith
    '';
  })
];

services.displayManager.sddm = {
  enable = true;
  theme = "sddm-monolith";
};
```

---

## 🛠️ Configuration
You can customize colors, fonts, backgrounds, and the layout by modifying `theme.conf` inside the theme folder:

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `Font` | String | `"Noto Sans"` | Typography family used across the greeter |
| `FontSize` | Integer | `14` | Font size scaling factor |
| `ClockEnabled` | Boolean | `"true"` | Toggle the clock display |
| `ClockPosition` | String | `"center"` | Position of the clock (`left`, `center`, `right`) |
| `CustomBackground` | Boolean | `"false"` | If `true`, loads your custom background wallpaper |
| `Background` | String | `"backgrounds/wallpaper.jpg"` | Relative path to custom wallpaper |
| `bgDark` | Color | `"#060608"` | Panel background color |
| `bgDefault` | Color | `"#060608"` | Main screen background color |
| `textDefault` | Color | `"#aaaaac"` | Inactive label/icon color |
| `textHighlight` | Color | `"#dadadc"` | Active / hovered element color |

---

## 🔍 Diagnostics & Testing
Test your theme changes directly in your current user session without logging out:
```bash
sddm-greeter --test-mode --theme /usr/share/sddm/themes/sddm-monolith
```
