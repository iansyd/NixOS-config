{ pkgs, ... }:
{
  gtk = {
    enable = true;
    gtk2 = {
      configLocation = "/home/ian/.config/.gtkrc-2.0-nix";
    };

    cursorTheme = {
        name = "Catppuccin-Macchiato-Blue";
        package = pkgs.catppuccin-cursors.macchiatoBlue;
    };

    theme = {
      name = "Catppuccin-Macchiato-Compact-Blue-dark";
      package = pkgs.catppuccin-gtk.override {
        size = "compact";
        accents = ["blue"];
        variant = "macchiato";
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-folders;
    };

/*    gtk3.extraConfig = {
        Settings = ''
            gtk-application-prefer-dark-theme = 1;
        '';
    };

    gtk4.extraConfig = {
        Settings = ''
            gtk-application-prefer-dark-theme = 1;
            '';
    };
*/
  };
}
