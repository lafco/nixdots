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
}
