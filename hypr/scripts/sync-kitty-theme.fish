#!/usr/bin/env fish

# Auto-sync kitty theme with hyprland current color scheme
# Reads ~/.config/hypr/scheme/current.conf and generates kitty theme

set scheme_file ~/.config/hypr/scheme/current.conf
set kitty_theme ~/.config/kitty/current-theme.conf

# Check if scheme file exists
if not test -f $scheme_file
    echo "Error: Scheme file not found: $scheme_file"
    exit 1
end

# Create kitty config directory if it doesn't exist
mkdir -p (dirname $kitty_theme)

# Function to get color value
function get_color
    set var_name $argv[1]
    set color_value (grep "^\$$var_name = " $scheme_file | cut -d' ' -f3)
    if test -n "$color_value"
        echo $color_value
    else
        echo "000000"  # fallback
    end
end

# Generate kitty theme
echo "# Caelestia Auto-Generated Theme" > $kitty_theme
echo "# Synced from ~/.config/hypr/scheme/current.conf" >> $kitty_theme
echo "# Generated: $(date)" >> $kitty_theme
echo "" >> $kitty_theme
echo "foreground #$(get_color text)" >> $kitty_theme
echo "background #$(get_color background)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# Terminal colors (color0-color15 from current.conf term0-term15)" >> $kitty_theme
echo "# Black" >> $kitty_theme
echo "color0 #$(get_color term0)" >> $kitty_theme
echo "color8 #$(get_color term8)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# Red" >> $kitty_theme
echo "color1 #$(get_color term1)" >> $kitty_theme
echo "color9 #$(get_color term9)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# Green" >> $kitty_theme
echo "color2 #$(get_color term2)" >> $kitty_theme
echo "color10 #$(get_color term10)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# Yellow" >> $kitty_theme
echo "color3 #$(get_color term3)" >> $kitty_theme
echo "color11 #$(get_color term11)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# Blue" >> $kitty_theme
echo "color4 #$(get_color term4)" >> $kitty_theme
echo "color12 #$(get_color term12)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# Magenta" >> $kitty_theme
echo "color5 #$(get_color term5)" >> $kitty_theme
echo "color13 #$(get_color term13)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# Cyan" >> $kitty_theme
echo "color6 #$(get_color term6)" >> $kitty_theme
echo "color14 #$(get_color term14)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# White" >> $kitty_theme
echo "color7 #$(get_color term7)" >> $kitty_theme
echo "color15 #$(get_color term15)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# Cursor" >> $kitty_theme
echo "cursor #$(get_color primary)" >> $kitty_theme
echo "cursor_text_color #$(get_color background)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# Selection highlight" >> $kitty_theme
echo "selection_foreground #$(get_color text)" >> $kitty_theme
echo "selection_background #$(get_color surfaceVariant)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# The color for highlighting URLs on mouse-over" >> $kitty_theme
echo "url_color #$(get_color primary)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# Window borders" >> $kitty_theme
echo "active_border_color #$(get_color primary)" >> $kitty_theme
echo "inactive_border_color #$(get_color surfaceVariant)" >> $kitty_theme
echo "bell_border_color #$(get_color secondary)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# Tab bar" >> $kitty_theme
echo "tab_bar_style fade" >> $kitty_theme
echo "tab_fade 1" >> $kitty_theme
echo "active_tab_foreground   #$(get_color background)" >> $kitty_theme
echo "active_tab_background   #$(get_color primary)" >> $kitty_theme
echo "active_tab_font_style   bold" >> $kitty_theme
echo "inactive_tab_foreground #$(get_color onSurfaceVariant)" >> $kitty_theme
echo "inactive_tab_background #$(get_color surfaceContainer)" >> $kitty_theme
echo "inactive_tab_font_style normal" >> $kitty_theme
echo "tab_bar_background #$(get_color background)" >> $kitty_theme
echo "" >> $kitty_theme
echo "# Title bar" >> $kitty_theme
echo "macos_titlebar_color #$(get_color background)" >> $kitty_theme

echo "Kitty theme synced: $kitty_theme"