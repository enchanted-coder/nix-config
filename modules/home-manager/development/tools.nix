{ pkgs
, ...
}: {
  home.packages = with pkgs; [
    bun
    gcc
    gnumake
    license-generator
    inetutils
    ripgrep
  ];
}
