# How to use this repo
---

## NixOS

### Standard install
1. clone nixos folder to your /etc/nixos/ folder
2. create symlinks for modules you would like activated from available-modules to activated-modules
3. `nixos-rebuild switch`


### Home-manager
1. clone nixos folder to your /etc/nixos/ folder
2. create symlinks for modules you would like activated from available-modules to activated-modules
3. replace {username} with your username in available-configs/home-manager.nix
4. `nixos-rebuild switch`
