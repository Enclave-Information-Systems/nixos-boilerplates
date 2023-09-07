# How to use this repo

## Install
1. `cd /etc/nixos/`
2. backup `configuration.nix` and `hardware-configuration.nix` into a seperate folder
3. `rm -r /etc/nixos/*`
4. `git clone https://git.enclaveis.com/Enclave-Information-Systems/nix-boilerplates.git /etc/nixos`
5. `cp vars.nix.example vars.nix`
6. edit `vars.nix` and change variables as needed
7. move `configuration.nix` and `hardware-configuration.nix` back into `/etc/nixos/` or run `sudo nixos-generate-config` to rebuild them
8. `sudo nixos-rebuild switch`

