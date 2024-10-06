{pkgs, user, ...}:
{
  services.greetd =
  {
    enable = true;
    settings =
    {
      default_session =
      {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "${user}";
      };
    };
  };
  environment.systemPackages = with pkgs;
  [
    greetd.tuigreet
  ];
}