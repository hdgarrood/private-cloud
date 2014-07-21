{ pkgs ? import <nixpkgs> {}, vars ? import ../vars.nix, ... }:
{
  environment.systemPackages = [
    pkgs.fail2ban
  ];
}
