{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nxs"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  time.timeZone = "America/SaoPaulo";

  services = {
    displayManager.ly.enable = true;
    pipewire = {
      enable = true;
    };
    xserver = {
      enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 35;
      windowManager.oxwm.enable = true;
    };
  };

  users.users.lafco = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs = {
    firefox.enable = true;
    hyprland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    ghostty
    git
    zoxide
    fzf
    eza
    bat
    btop
  ];

  hardware = {
    bluetooth.enable = true;
    graphics.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
  system.stateVersion = "25.05"; # Did you read the comment?
}
