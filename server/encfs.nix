{ pkgs ? import <nixpkgs> {}, vars ? import ../vars.nix, ... }:
{
  environment.systemPackages = [
    pkgs.encfs
  ];

  system.activationScripts.encfs =
    ''
      mkdir -p /encrypted
      mkdir -m 0775 -p /decrypted
      chown root:mail /decrypted
      ENCFS=/run/current-system/sw/bin/encfs

      encfs_exists() {
        ls /encrypted/* >/dev/null 2>/dev/null
      }

      encfs_mounted() {
        [ -f /decrypted/test ]
      }

      encfs_create() {
        printf "p\n${vars.encfs_password}" | $ENCFS /encrypted /decrypted \
          --public --stdinpass
        touch /decrypted/test
      }

      encfs_mount() {
        printf "${vars.encfs_password}" | $ENCFS /encrypted /decrypted \
          --public --stdinpass
        touch /decrypted/test
      }

      if encfs_exists; then
        if ! encfs_mounted; then
          encfs_mount
        fi
      else
        encfs_create
      fi
    '';
}
