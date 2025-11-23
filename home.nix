{ config, pkgs, inputs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixdots/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    qtile = "qtile";
    nvim = "nvim";
    zellij = "zellij";
    ghostty = "ghostty";
    nushell = "nushell";
    startship = "startship";
    hypr = "hypr";
  };
in {
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  programs = {
    git = {
      enable = true;
      userName = "lafco";
      userEmail = "vinigfalconi@outlook.com.br";
    };
    firefox = {
      enable = true;
      profiles.lafco = {
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          bypass-paywalls-clean
          facebook-container
          i-dont-care-about-cookies
          to-google-translate
          ublock-origin
          youtube-shorts-block
        ];
      };
    };
    bash = {
      enable = true;
      shellAliases = {
        cat = "bat";
        ls = "eza --icons=always";
        fullClean = ''
          nix-collect-garbage --delete-old
          sudo nix-collect-garbage -d
          sudo /run/current-system/bin/switch-to-configuration boot
        '';
        rebuild = "sudo nixos-rebuild switch --flake ~/nixdots/";
      };
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
    };
  };

  home = {
    username= "lafco";
    homeDirectory = "/home/lafco";
    stateVersion = "25.05";
    sessionVariables = {
      BROWSER = "firefox";
      EDITOR = "nvim";
      TERMINAL = "ghostty";
    };
    packages = with pkgs; [
      neovim
      ripgrep
      nodejs
      pnpm
      zellij
      python3.withPackages (python-pkgs: [
        python-pkgs.pip
      ])
      rustup
      steam
      steam-run
      (lutris.override {
        extraPkgs = pkgs: [
          wineWowPackages.stable
          winetricks
        ];
      })
      qbittorrent
      blueberry
      simp1e-cursors
      hyprshot
    ];
  };
}
