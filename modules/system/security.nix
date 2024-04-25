{config, pkgs, ... }: 
{
  # enable Polkit
  security.polkit.enable = true;
  
  # Security services
  security.rtkit.enable = true;

  # todo: try gettomg GTK based polkit agent running
  # get polkit auth agent 
  environment.systemPackages = with pkgs;
  [
    lxqt.lxqt-policykit
  ];
}