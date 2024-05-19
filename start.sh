#!/bin/sh
# .dotfiles.sh v1.0.0

directory="${DOTFILES_DIR:-$(pwd)}"

#
# Repository functions
#

repository_update() {
    sudo git reset --hard HEAD
    sudo git pull
    sudo chmod +x start.sh
}

#
# NixOS functions
#

nixos_build() {
    sudo rm -f ~/.dotfiles/nixos/hardware-configuration.nix
    sudo nixos-generate-config --show-hardware-config | sudo tee ~/.dotfiles/nixos/hardware-configuration.nix > /dev/null
    sudo nixos-rebuild switch --flake .#nixos --show-trace
}

nixos_reboot() {
    sudo reboot now
}

#
# Command functions
#

r_update() {
    repository_update
    log "=" "Repository updated."
}

n_build() {
    nixos_build
    log "=" "NixOS built."
}

n_reboot() {
    nixos_reboot
    log "=" "NixOS rebooted."
}

n_install() {
    r_update
    sleep 1
    n_build
    sleep 1
    log "@" "NixOS installed."
    sleep 1
    n_reboot
}

s_help() {
cat <<-EOF
Usage:
u : Update
b : Build
r : Reboot
i : Install
h : Help
q : Quit
EOF
}

s_quit() {
    log "*" "Stopping..."
    exit 0
}

#
# Log functions
#

log() {
    printf '%s\n' "[$(date +"%H:%M:%S %Y/%m/%d")] ($1) DOTFILES: $2"
}

#
# Main functions
#

main() {
    printf ":"
    read -r command
    case "$command" in
        u)  r_update   ;;
        b)  n_build    ;;
        r)  n_reboot   ;;
        i)  n_install  ;;
        h)  s_help     ;;
        q)  s_quit     ;;
        *)  printf '%s\n' "Invalid command";;
    esac
}

start() {
    sudo -v

    while true; do sudo -v; sleep 60; done & sudo_keepalive_pid=$!
    trap 'kill "$sudo_keepalive_pid"' EXIT

    cd "$directory" || exit 1

    while true
    do
        main
    done
}

start
