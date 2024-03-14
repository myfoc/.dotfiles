#!/bin/sh
set -e

cd ~/.dotfiles

sudo git reset --hard HEAD

sudo git pull

sudo chmod +x install.sh

sudo rm -f ~/.dotfiles/nixos/hardware-configuration.nix

sudo nixos-generate-config --show-hardware-config > ~/.dotfiles/nixos/hardware-configuration.nix

sudo nixos-rebuild switch --flake .#nixos --show-trace

echo "Rebooting in 5 seconds."
sleep 5

sudo reboot now