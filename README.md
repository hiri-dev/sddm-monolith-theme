# Monolith SDDM Theme

A clean, pixel-perfect, and ultra-minimalist monochrome theme for SDDM.

## Features
- Pure monochrome dark aesthetic
- Pixel-perfect symmetrical layout
- Elegant drop-down session selector with keyboard navigation support
- Smooth, micro-animated active states and border transitions

## Preview
![Screenshot](preview.png?v=2)

## Installation

1. Copy the theme directory to the SDDM themes folder:
   ```bash
   sudo cp -r sddm-monolith /usr/share/sddm/themes/
   ```

2. Enable the theme in `/etc/sddm.conf`:
   ```ini
   [Theme]
   Current=sddm-monolith
   ```

## Dependencies
Ensure the following packages are installed on your system:
- `qt5-quickcontrols2`
- `qt5-graphicaleffects`
- `qt5-svg`
