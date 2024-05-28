{inputs, ...}: {
  services.hyprpaper = let
    wallpaperDir = "${inputs.self}/modules/extends/serene/home/desktop/wm/hyprland/wallpapers";
  in {
    enable = true;

    preloads = [
      "${wallpaperDir}/hypr95.png"
    ];

    wallpapers = [
      ",${wallpaperDir}/hypr95.png"
    ];
  };
}
