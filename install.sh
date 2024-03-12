#!/bin/sh
set -e

sudo su

cd ~/.dotfiles

git reset --hard HEAD

git pull

chmod +x install.sh

rm -f ~/.dotfiles/nixos/hardware-configuration.nix

nixos-generate-config --show-hardware-config > ~/.dotfiles/nixos/hardware-configuration.nix

nixos-rebuild switch --flake .#nixos --show-trace

exit

echo "Rebooting in 5 seconds."
sleep 5

reboot now