{ vars ? import ./vars.nix }:
{
  network.description = "private cloud";
  network.enableRollback = true;

  server =
    { config, pkgs, ... }:
    {
      imports = [
        ./server/basic.nix
        ./server/encfs.nix
        ./server/monit.nix
        ./server/fail2ban.nix
        ./server/dovecot.nix
        ./server/httpd.nix
      ];
    };
}
