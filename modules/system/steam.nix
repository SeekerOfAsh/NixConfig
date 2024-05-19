{pkgs, ...}:
{
  hardware.xone.enable = true;
  programs.gamemode.enable = true;
  programs.steam = 
  {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
