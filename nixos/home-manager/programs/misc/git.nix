{ pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "danieltogey@pm.me";
    userName = "Daniel Togey";
    ignores = [
      ".idea"
      ".vscode"
    ];
  };
}
