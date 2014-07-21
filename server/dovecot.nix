{
  services.dovecot2 = {
    enable = true;
    enableImap = true;
    enablePop3 = true;
  };

  users.extraGroups = {
    mail = {};
    fuse = {};
  };

  users.extraUsers.mail = {
    name = "mail";
    group = "mail";
    extraGroups = [ "fuse" ];
  };
}
