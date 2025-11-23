{ config, pkgs, ... };

let aliases = {
  cat = "bat";
  ls = "eza --icons=always";
  fullClean = ''
    nix-collect-garbage --delete-old
    sudo nix-collect-garbage -d
    sudo /run/current-system/bin/switch-to-configuration boot
  '';
  rebuild = "sudo nixos-rebuild switch --flake ~/nixdots/";
};
in {
  programs = {
    nushell = {
      enable = true;
      shellAliases = aliases;
    };
    bash = {
      enable = true;
      shellAliases = aliases;
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
