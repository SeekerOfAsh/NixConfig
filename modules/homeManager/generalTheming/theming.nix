{pkgs, host, gtkTheme, config, ...}:
let
  inherit (import ../../../hosts/${host}/hostSpecific/gtkThemes/${gtkTheme}.nix)
    gtkThemePackage
    gtkThemeName;
in
{
  home =
  {
    pointerCursor =
    {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = config.desktop.cursorSize;
    };
  };
  gtk =
  {
    enable = true;
    theme =
    {
      package = pkgs."${gtkThemePackage}";
      name = "${gtkThemeName}";
    };
    iconTheme =
    {
      package = pkgs.beauty-line-icon-theme;
      name = "BeautyLine";
    };
    gtk3.extraConfig =
    {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig =
    {
      gtk-application-prefer-dark-theme=1;
    };
    font =
    {
      name = config.desktop.font.name;
      size = config.desktop.font.size;
    };
  };
  qt =
  {
    enable = true;
    platformTheme.name = "gtk3";
    style = 
    {
      name = "adwaita-dark";
    };
  };
}
