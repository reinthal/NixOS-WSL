{ lib, ... }: {
  imports = [
    # required for options from 24.11 to work on 24.05
    # TODO: remove when 24.11 becomes stable
    ./24.05-compat.nix

    ./build-tarball.nix
    ./docker-desktop.nix
    ./interop.nix
    ./podman.nix
    ./recovery.nix
    ./systemd
    ./usbip.nix
    ./version.nix
    ./vscode-remote.nix
    ./welcome.nix
    ./wsl-conf.nix
    ./wsl-distro.nix

    (lib.mkRemovedOptionModule [ "wsl" "docker-native" ]
      "Additional workarounds are no longer required for Docker to work. Please use the standard `virtualisation.docker` NixOS options.")
    (lib.mkRemovedOptionModule [ "wsl" "interop" "preserveArgvZero" ]
      "wsl.interop.preserveArgvZero is now always enabled, as used by modern WSL versions.")
    (lib.mkRemovedOptionModule [ "wsl" "tarball" "includeConfig" ]
      "The tarball is now always generated including configuration.")
  ];
}
