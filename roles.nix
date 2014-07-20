{
  network.description = "private cloud";
  network.enableRollback = true;

  server =
    { config, pkgs, ... }:
    { services.httpd.enable = true;
      services.httpd.adminAddr = "harry@garrood.me";

      networking.firewall.enable = true;
      networking.firewall.allowPing = true;
      networking.firewall.allowedTCPPorts = [ 80 ];

      users.extraUsers = {
        harry = { };
      };
    };
}
