# Monolith SDDM Theme

A clean, pixel-perfect, and ultra-minimalist monochrome theme for SDDM.

## Features
- Pure monochrome dark aesthetic
- Pixel-perfect symmetrical layout
- Elegant drop-down session selector with monitor icon and keyboard navigation support
- Smooth, micro-animated active states and border transitions
- Highly compatible across both X11 and Wayland sessions

## Preview
![Screenshot](preview.png?v=3)

## Installation

1. Copy the theme directory to the SDDM themes folder:
   ```bash
   sudo cp -r sddm-monolith /usr/share/sddm/themes/
   ```

2. Enable the theme in `/etc/sddm.conf` (or `/etc/sddm.conf.d/theme.conf`):
   ```ini
   [Theme]
   Current=sddm-monolith
   ```

## Dependencies
Ensure the following packages are installed on your system:

### Arch Linux
- `qt5-quickcontrols2`
- `qt5-graphicaleffects`
- `qt5-svg`

### Fedora
- `qt5-qtquickcontrols2`
- `qt5-qtgraphicaleffects`
- `qt5-qtsvg`

### Debian / Ubuntu
- `qml-module-qtquick-controls2`
- `qml-module-qtgraphicaleffects`
- `qml-module-qtquick-layouts`

## Testing the Theme
You can test the theme without logging out by running the following command:
```bash
sddm-greeter --test-mode --theme /usr/share/sddm/themes/sddm-monolith
```

## Configuration
You can customize the theme by editing `theme.conf`:

| Option | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `Font` | String | `"Noto Sans"` | System font family to use |
| `FontSize` | Integer | `14` | Font size |
| `ClockEnabled` | Boolean | `"true"` | Toggle the clock display |
| `ClockPosition` | String | `"center"` | Clock position (`left`, `center`, `right`) |
| `CustomBackground` | Boolean | `"false"` | Use custom background image |
| `Background` | String | `"backgrounds/wallpaper.jpg"` | Path to custom background image |
| `bgDark` / `bgDefault` | Color | `"#060608"` | Background color |
| `textDefault` | Color | `"#aaaaac"` | Default text and icon color |
| `textHighlight` | Color | `"#dadadc"` | Highlight/Hover text and icon color |
