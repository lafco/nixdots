{
  imports = [
    ./git.nix
    ./config.nix
    ./enviroment.nix
    ./packages.nix
    ./programs.nix
    ./shell.nix
  ];
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };
}
