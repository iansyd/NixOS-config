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
  };

    home.packages = with pkgs; [

      kdePackages.plasma-browser-integration

    ];
	
    # Environment Variables
    home.sessionVariables = {
        BROWSER = "brave";
        EDITOR = "nvim";
        TERMINAL = "kitty";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORMTHEME = "gtk3";
        QT_SCALE_FACTOR = "1";
        MOZ_ENABLE_WAYLAND = "1";
        SDL_VIDEODRIVER = "wayland";
        QT_QPA_PLATFORM = "wayland-egl";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        GTK_CSD = "0";
        WLR_DRM_DEVICES = "/dev/dri/card0";
        WLR_NO_HARDWARE_CURSORS = "1";
        CLUTTER_BACKEND = "wayland";
        WLR_RENDERER = "vulkan";
        XCURSOR_SIZE = "32";
        GTK_THEME="Catppuccin-Macchiato-Compact-Blue-Dark";
        XDG_SESSION_TYPE = "wayland";
        GTK_USE_PORTAL = "1";
        NIXOS_XDG_OPEN_USE_PORTAL = "1";
        #XDG_BIN_HOME = "\${HOME}/.local/bin";
        XDG_DATA_HOME = "\${HOME}/.local/share";
        XDG_DATA = "\${HOME}/.local/share";
    };
}
