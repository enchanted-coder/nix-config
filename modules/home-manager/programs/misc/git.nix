{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "enchanted-coder";
    userEmail = "danieltogey@pm.me";
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  home.packages = [ pkgs.gh pkgs.git-lfs ];
}
