{pkgs, lib, inputs, config, ...}:
let
  hyprctl = lib.getExe' inputs.hyprland.packages.x86_64-linux.hyprland "hyprctl";
  notifySend = lib.getExe pkgs.libnotify;
  mainMonName = config.desktop.system.mainMon.name;
  mainMonRes = config.desktop.system.mainMon.res;
  mainMonOc = config.desktop.system.mainMon.oc;
  mainMonPos = config.desktop.system.mainMon.pos;
in
{
  home.packages = with pkgs;
  [(
    writeShellScriptBin "hyprTweaks"
    ''
      adaptiveSync=false
      highDynamicRange=false
      
      hyprCommand="keyword animations:enabled false;"
      hyprCommand+=" keyword decoration:blur:enabled false;"
      hyprCommand+=" keyword decoration:drop_shadow false;"
      
      notifyGroup="Hyprland Tweaks"
      notifyMessage="Tweaks on:"
      
      if [[ "${mainMonName}" == "" || "${mainMonRes}" == "" || "${mainMonOc}" == "" || "${mainMonPos}" == "" ]]; then
        ${notifySend} -u critical -a 'Hyprland Tweaks' 'Missing main monitor config!'
        exit 2
      fi
      
      monitorConfig="monitor ${mainMonName}, ${mainMonRes}@${mainMonOc}, ${mainMonPos}, 1"
      
      while getopts ":adhpr" opt; do
        case $opt in
          a)
            adaptiveSync=true
            hyprCommand+=" keyword cursor:min_refresh_rate 0;"
            hyprCommand+=" keyword cursor:no_break_fs_vrr true;"
            hyprCommand+=" keyword cursor:no_hardware_cursors true;"
            hyprCommand+=" keyword general:allow_tearing true;"
            notifyMessage+=" VRR"
            ;;
          d)
            hyprCommand+=" keyword render:direct_scanout true;"
            notifyMessage+=" DS"
            ;;
          h)
            highDynamicRange=true
            notifyMessage+=" HDR"
            ;;
          p)
            monitorConfig="monitor ${mainMonName}, preferred, ${mainMonPos}, 1"
            notifyMessage+=" 120hz"
            ;;
          r)
            ${hyprctl} reload
            ${notifySend} -u normal -a "$notifyGroup" "Reloaded Hyprland."
            exit 0
            ;;
          ?)
            ${notifySend} -u critical -a "$notifyGroup" "Unknown parameters!"
            exit 1
            ;;
        esac
      done
      
      if $adaptiveSync; then
        monitorConfig+=", vrr, 2"
      fi
      
      if $bitdepth; then
        monitorConfig+=", bitdepth, 10"
      fi
      
      if $maxRefreshRate || $adaptiveSync || $bitdepth; then
        hyprCommand+=" keyword $monitorConfig;"
      fi
      
      ${hyprctl} --batch $hyprCommand
      
      ${notifySend} -u normal -a "$notifyGroup" "$notifyMessage"
      
      sleep 20s
    ''
  )];
}