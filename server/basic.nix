{
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    permitRootLogin = "yes";
  };

  security.sudo.wheelNeedsPassword = false;

  networking.firewall = {
    enable = true;
    allowPing = true;
    allowedTCPPorts = [ 80 443 ];
  };

  users.extraUsers.harry = {
    name = "harry";
    group = "users";
    extraGroups = [ "wheel" ];
    createHome = true;
    home = "/home/harry";
    shell = "/run/current-system/sw/bin/bash";
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdGXN2AJwq/9U5Q76jHzHww3FJE9OMjg+6JfsnjzTHHu+uLNkxMInMMuvWAnE2E1zK060ixzKLUYE5KR4nkxisdHYd8zb4GmJIMcUvOJznybydCP48D60Cfr8PlSg+owJ8lLHhrZVEz3OyZQdejCRNREccE3MwEd+pYsN3B5K1mJRh+lCJM/Q8hH8NAaMLeYKako0mP9p000W8MSsEONX7Pe9UMctroX/VCB8C6wlHjNaOLS288Csacs/XS4Yay9/8FcSDW/lMSaqFerSShNfBqPjE1xsYJIW3LnMwT+7C18rfQZ1LFFf6GZzRJq1aDrecL36v4yA5cL7HyjW1ah6v harry@hawk-mint" ];
  };
}
