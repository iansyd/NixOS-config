{ pkgs, ... }:

let configDir = ./config;
in
{

  home.sessionVariables.GTK_THEME = "palenight";

  home.packages = with pkgs; [
    
    # for app menu extension
    gnome-menus
    xdg-utils
    xdg-user-dirs-gtk
    gettext
    
    dconf
    dconf-editor

#    gnome-extension-manager

    gnomeExtensions.blur-my-shell
    gnomeExtensions.pop-shell
    gnomeExtensions.appindicator 
   # gnomeExtensions.arcmenu
    gnomeExtensions.dash-to-panel
    gnomeExtensions.dash-to-panel-menu
    gnomeExtensions.just-perfection

    gnome-system-monitor
    gnome-tweaks

  ];

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };


  dconf = {
    enable = true;
    
    # Use `dconf watch /` to track stateful changes you are doing, then set them here.
    settings = {

      "org/gnome/shell" = {
        disable-user-extensions = false; # enables user extensions
        
        enabled-extensions = [
          # Put UUIDs of extensions that you want to enable here.
          # If the extension you want to enable is packaged in nixpkgs,
          # you can easily get its UUID by accessing its extensionUuid
          # field (look at the following example).
          # pkgs.gnomeExtensions.gsconnect.extensionUuid

          # Alternatively, you can manually pass UUID as a string.
     #    "arcmenu@arcmenu.com"
          "dash-to-panel@jderose9.github.com"
          "appindicatorsupport@rgcjonas.gmail.com"
          "blur-my-shell@aunetx"
	  "just-perfection@jrahmatzadeh"
          "just-perfection-desktop@just-perfection" 
        ];
        disabled-extensions = [
       	  "pop-shell@system76.com"
        ];
        
	favorite-apps = [
          "org.gnome.Settings.desktop"
          "org.gnome.Nautilus.desktop"
          "brave-browser.desktop"
          "kitty.desktop"
          "com.mattjakeman.ExtensionManager.desktop"
	  # "org.gnome.Extensions.desktop"
        ];
      }; # ending "org/gnome/shell" = {
      
      # Configure individual extensions
      "org/gnome/shell/extensions/blur-my-shell" = {
        brightness = 0.75;
        noise-amount = 0;
      };
        
      "org/gnome/shell/extensions/dash-to-panel" = {
        "prefs-opened" = false;
        "primary-monitor" = "HPN-CN471407HK";
        "panel-anchors" = "{\"CMN-0x00000000\":\"MIDDLE\" , \"HPN-CN471407HK\":\"MIDDLE\"}";
        "panel-element-positions" = "{}";
	"panel-lengths" = "{\"CMN-0x00000000\":-1 , \"HPN-CN471407HK\":-1 }";
        "panel-positions" = "{}";
        "panel-sizes" = "{\"CMN-0x00000000\":41 , \"HPN-CN471407HK\":41 }";
        "extension-version" = 68;
	"focus-highlight-dominant" = true;
	"dot-color-override" = false;
	"dot-style-focused" = "CILIORA";
	"dot-style-unfocused" = "DOTS";
	"appicon-style" = "NORMAL";
	"animate-appicon-hover" = true;
	"appicon-padding" = 0;
	"appicon-margin" = 4;
	"global-border-radius" = 5;
      };

      "org/gnome/shell/extensions/just-perfection" = {
        "support-notifier-showed-version" = 34;
	"just-perfection/support-notifier-type" = 0;
      };
/*
      "arcmenu" = {
        #"search-entry-border-radius" = ( true,  25 );
        "prefs-visible-page" = 0;
        "multi-monitor" = true;
        "dash-to-panel-standalone" = true;
        "show-activities-button" = true;
      };
*/     
      # clock--show--weekday
      # You need quotes to escape '/'
      "org/gnome/desktop/interface" = {
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
      };
    }; # ending settings = {
  }; # ending dconf = {
} # end
