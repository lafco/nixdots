{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
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
    yuzu-mainline
    (lutris.override {
      extraPkgs = pkgs: [
        wineWowPackages.stable
        winetricks
      ];
    })
    qbittorrent
    obsidian
    blueberry
  ];
}
