## Install
```
cd ~/
```

```
sudo git clone https://github.com/CofymDD/.dotfiles.git ~/
```

```
sudo nixos-generate-config --show-hardware-config > ~/.dotfiles/nixos/hardware-configuration.nix
```

## Update
```
sudo git pull
```

## Build
```
sudo nixos-rebuild switch --flake .
```