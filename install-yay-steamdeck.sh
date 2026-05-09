#!/bin/bash

# 1. Desactivar modo de solo lectura de SteamOS
echo "Desactivando modo de solo lectura..."
sudo steamos-readonly disable

# 2. Inicializar llaves de pacman (por si acaso)
echo "Configurando llaves de pacman..."
sudo pacman-key --init
sudo pacman-key --populate archlinux

# 3. Instalar todas las dependencias necesarias
# Reemplazamos --needed por --noconfirm para forzar la actualización/instalación
echo "Instalando dependencias de compilación..."
sudo pacman -S --noconfirm base-devel linux-api-headers libarchive openssl git go

# 4. Clonar y compilar yay desde AUR
echo "Clonando y compilando yay..."
cd /tmp
rm -rf yay
git clone https://archlinux.org
cd yay

# 5. Compilar e instalar
makepkg -si --noconfirm

echo "----------------------------------------"
echo "Proceso finalizado. Prueba ejecutando: yay --version"
