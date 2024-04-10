{ inputs, ... }: 
{
  imports = [ (import ./hyprland.nix) ]
    ++ [ (import ./config.nix) ]
    ++ [ inputs.hyprland.homeManagerModules.default ];
}
