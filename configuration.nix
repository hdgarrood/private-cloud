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
}
