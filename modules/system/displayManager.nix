{
  # Enable and configure sddm
  services.displayManager.sddm = 
  {
    enable = true;
    autoNumlock = true;
    wayland.enable = true;
  };
}
