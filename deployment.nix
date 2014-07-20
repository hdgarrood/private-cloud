{
  server =
    { config, pkgs, ... }:
    { deployment.targetHost = "albatross.garrood.me";
      deployment.owners = [ "harry@garrood.me" ];
      imports = [ ./configuration.nix {} ];
    };
}
