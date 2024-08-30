{pkgs, lib, ...}:
{
  xdg.configFile."mimeapps.list".force = true;
  xdg.mimeApps =
  {
    enable = true;
    defaultApplications =
    {
      "audio/mp3" = ["org.gnome.Lollypop.desktop"];
      "audio/flac" = ["org.gnome.Lollypop.desktop"];
      "video/mp4" = ["io.github.celluloid_player.Celluloid.desktop"];
      "inode/directory" = ["thunar.desktop"];
      "application/pdf" = ["librewolf.desktop"];
      "image/jpeg" = ["org.xfce.ristretto.desktop"];
      "image/png" = ["org.xfce.ristretto.desktop"];
      "text/plain" = ["org.xfce.mousepad.desktop"];
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = ["onlyoffice-desktopeditors.desktop"];
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = ["onlyoffice-desktopeditors.desktop"];
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = ["onlyoffice-desktopeditors.desktop"];
    };
  };
}