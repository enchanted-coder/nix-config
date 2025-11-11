{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    htop
    qbittorrent
    vesktop
    fastfetch
    obsidian
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron"
      ];
    };
  };
}
