let configDir = ./config;
in
{

  home.file = {
    # fish files
    #".config/fish".source = config/fish;

    #".config/fish/config.fish".source = ./config/fish/config.fish;
    #".config/fish/fish_variables".source = config/fish/fish_variables;
    #".config/fish/functions/fish_prompt.fish".source = ./config/fish/functions/fish_prompt.fish;
    #".config/fish/functions/gitup.fish".source = ./config/fish/functions/gitup.fish;

    #".config/kitty".source = ./config/kitty;

    # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    # This is a sample
    #".config/demo1.conf".text = ''
    #  The file content goes here.
    #'';

    ".config/wallpapers".source = "${configDir}/wallpapers";
    ".config/neofetch".source = "${configDir}/neofetch";
    ".config/hypr".source = "${configDir}/hypr";
    ".config/swayidle".source = "${configDir}/swayidle";
    ".config/swaylock".source = "${configDir}/swaylock";
    ".config/wlogout".source = "${configDir}/wlogout";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/btop".source = "${configDir}/btop";
    ".config/wofi".source = "${configDir}/wofi";
    ".config/mako".source = "${configDir}/mako";

  };
}
