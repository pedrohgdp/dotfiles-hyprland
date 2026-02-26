#!/bin/bash

set -e

echo "🚀 Atualizando sistema..."
sudo pacman -Syu --noconfirm

echo "📦 Instalando pacotes..."
sudo pacman -S --needed --noconfirm - < packages.txt

echo "📁 Criando diretórios..."
mkdir -p ~/.config

echo "🔗 Criando symlinks..."

ln -sf $(pwd)/waybar ~/.config/waybar
ln -sf $(pwd)/rofi ~/.config/rofi
ln -sf $(pwd)/hypr ~/.config/hypr
ln -sf $(pwd)/scripts ~/.config/waybar/scripts

ln -sf $(pwd)/gtk/gtk-3.0 ~/.config/gtk-3.0
ln -sf $(pwd)/gtk/gtk-4.0 ~/.config/gtk-4.0

echo "🎨 Aplicando tema GTK..."
gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

echo "🖋 Configurando Qt..."
echo "export QT_QPA_PLATFORMTHEME=qt6ct" >> ~/.profile

echo "✅ Instalação finalizada!"
