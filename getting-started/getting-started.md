# Getting started with NixOps

* If you're not ec2 or hetzger, you will need to supply deployment.targetHost
  for a deploy over SSH
* You need to start by putting a Linux distro on there. I chose Debian 7.5,
  we'll see how that goes.
* https://github.com/NixOS/nixops/issues/200#issuecomment-46518842 implies that
  I might need to have NixOS running on my Linode box first. Seems a good idea
  anyway. (update: nixops manual on deployment.targetEnv confirms this)
* Following instructions on https://nixos.org/wiki/Install_NixOS_on_Linode:
  * Create disk images:
    * swap, 256MB, swap
    * boot, 200MB, had to select 'unformatted/raw'
    * nixos, remainder of space, ext4
  * Boot into Rescue Mode, with /dev/xvda: boot, b: swap, c: nixos
  * Connect via Lish ajax console
  * Had to fix NIX_PATH variable: should have been:

        $ export NIX_PATH=/root/.nix-defexpr/channels/nixos-14.04

  * Edited default configuration.nix, copied in this folder
* NixOS installed, yay!
* Now to make nixops deploys work, added to ~/.ssh/config on my machine:

    Host albatross.garrood.me
      User deploy

* Copied /etc/nixos/configuration.nix and hardware-configuration.nix from
  Linode
* Deploy failed; tried adding my ssh public key to root authorized keys
* Forgot to set password for deploy, did that via lish
* Had to add my SSH key into /root/.ssh/authorized_keys2, as on https://github.com/NixOS/nixops/issues/200#issuecomment-46518842
* Deploy works! Pushed to github.
* Oh god, passwordless root SSH login. Fixing.
* Summary:
  * edit roles.nix / deployment.nix
  * to 'commit' changes: nixops modify -d albatross roles.nix configuration.nix
  * to deploy: nixops deploy -d albatross
* Starting to think nixops is overkill, maybe just nixos would do
  * But I do get the ability to deploy on virtualbox
* It seems /etc/nixos/configuration.nix doesn't get updated. hmmm. Maybe I
  should contribute a linode backend to nixops.
* Deleted (unused) deploy user; you have to do it manually after removing from
  configuration.
* Added EncFS startup script.
* Added monit.
* Error from encfs: "Error decoding volume key, password incorrect" fixed
  problem with encfs startup script.
