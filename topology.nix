{ config, lib, pkgs, ... }:

let
  inherit (lib) mkConnection mkSwitch mkRouter mkInternet;
in
{
  # Host info for 'shadow'
  nodes.shadow = {
    name = "🖥️ shadow";
    hardware.info = "My thinkpad";
    interfaces = {
      enp0s31f6 = {
        addresses = [ "192.168.1.100/24" ];
        network = "lan";
      };
      wlp0s20f3 = {
        addresses = [ "192.168.1.68/24" ];
        network = "wifi";
      };
    };
  };


  # Network configurations
  networks.wifi = {
    name = "Wi-Fi Network";
    cidrv4 = "192.168.1.68/24";
  };

  networks.lan = {
    name = "LAN Network";
    cidrv4 = "192.168.1.0/24";
  };
}
