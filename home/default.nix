{ config, pkgs, ... }:

{
  imports = [
    ./user
  ];
  home = {
    username= "lafco";
    homeDirectory = "/home/lafco";
    stateVersion = "25.05";
  };
}
