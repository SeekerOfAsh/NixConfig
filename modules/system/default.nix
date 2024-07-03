{...}:
{
  imports =
  [
    ./hardware/bluetooth.nix
    ./hardware/kernel.nix
    ./hardware/printing.nix
    ./hardware/sound.nix
    ./software/fileManager.nix
    ./software/fonts.nix
    ./software/gaming.nix
    ./software/generalSoftware.nix
    ./software/terminal.nix
    #./software/virtualisation.nix
    ./system/displayManager.nix
    ./system/environmentVariables.nix
    #./system/flatpak.nix
    ./system/security.nix
    ./system/users.nix
    ./windowManagers/hyprland.nix
  ];
}
