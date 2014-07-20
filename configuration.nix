{ config, pkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.grub = {
    enable = true;
    version = 1;
    extraPerEntryConfig = "root (hd0)";
    device = "nodev";
  };

  networking.hostName = "albatross.garrood.me";

  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  services.openssh.enable = true;
  users.extraUsers.deploy = {
    name = "deploy";
    group = "users";
    extraGroups = [ "wheel" ];
    createHome = true;
    home = "/home/deploy";
    useDefaultShell = true;
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdGXN
2AJwq/9U5Q76jHzHww3FJE9OMjg+6JfsnjzTHHu+uLNkxMInMMuvWAnE2E1zK060ixzKLUYE5KR4nkxi
sdHYd8zb4GmJIMcUvOJznybydCP48D60Cfr8PlSg+owJ8lLHhrZVEz3OyZQdejCRNREccE3MwEd+pYsN
3B5K1mJRh+lCJM/Q8hH8NAaMLeYKako0mP9p000W8MSsEONX7Pe9UMctroX/VCB8C6wlHjNaOLS288Cs
acs/XS4Yay9/8FcSDW/lMSaqFerSShNfBqPjE1xsYJIW3LnMwT+7C18rfQZ1LFFf6GZzRJq1aDrecL36
v4yA5cL7HyjW1ah6v harry@hawk-mint " ];
  };
}
