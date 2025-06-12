{ pkgs, ... }:

let configDir = ./config;
in
{

  home.sessionVariables.GTK_THEME = "palenight";

  home.packages = with pkgs; [
    
    gnome-extension-manager
    gnome-system-monitor
    gnome-tweaks
    dconf
    dconf-editor
    nerd-fonts.m+

    # for app menu extension
    gnome-menus
    xdg-utils
    xdg-user-dirs-gtk
    gettext
    
    # tools for astra-monitor extension
    wirelesstools
    pciutils
    iotop
    gtop
    

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
#          "dash-to-panel@jderose9.github.com"
#	  "dashtopanelmenu@github.com.howbea"
          "appindicatorsupport@rgcjonas.gmail.com"
          "blur-my-shell@aunetx"
	  "just-perfection@jrahmatzadeh"
          "just-perfection-desktop@just-perfection" 
          "monitor@astraext.github.io"
	  "gsconnect@andyholmes.github.io"
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
#	  "org.gnome.Extensions.desktop"
        ];
      }; # ending "org/gnome/shell" = {
      
      # Configure individual extensions
      "org/gnome/shell/extensions/blur-my-shell" = {
        brightness = 0.75;
        noise-amount = 0;
      };

/*
      "org/gnome/shell/extensions/dash-to-panel" = {
        "prefs-opened" = false;
        "primary-monitor" = "HPN-CN471407HK";
        "panel-anchors" = "{\"CMN-0x00000000\":\"MIDDLE\" , \"HPN-CN471407HK\":\"MIDDLE\", \"LGD-0x00000000\":\"MIDDLE\"}";
        "panel-element-positions" = "{}";
	"panel-lengths" = "{\"CMN-0x00000000\":-1 , \"HPN-CN471407HK\":-1, \"LGD-0x00000000\":-1 }";
        "panel-positions" = "{}";
        "panel-sizes" = "{\"CMN-0x00000000\":41 , \"HPN-CN471407HK\":41, \"LGD-0x00000000\":41 }";
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
*/

      "org/gnome/shell/extensions/just-perfection" = {
        "support-notifier-showed-version" = 34;
	"just-perfection/support-notifier-type" = 0;
      };

      "org/gnome/shell/extensions/gsconnect" = {
      	"name" = "dellLaptop";
      };


      "org/gnome/shell/extensions/astra-monitor" = {
        "sensors-header-show" = true;
      };
/*
      "profiles" = "{\"default\":{\"panel-margin-left\":0,\"sensors-header-tooltip-sensor2-digits\":-1,\"memory-update\":3,\"gpu-header-memory-graph-color1\":\"rgba(29,172,214,1.0)\",\"panel-box\":\"right\",\"memory-header-show\":true,\"network-header-tooltip-io\":true,\"processor-header-bars-color2\":\"rgba(214,29,29,1.0)\",\"processor-header-icon-size\":18,\"storage-source-storage-io\":\"auto\",\"sensors-header-tooltip-sensor4-name\":\"\",\"storage-header-icon-color\":\"\",\"network-source-public-ipv4\":\"https:api.ipify.org\",\"storage-header-io-graph-color2\":\"rgba(214,29,29,1.0)\",\"storage-header-io\":false,\"processor-menu-top-processes-percentage-core\":true,\"sensors-header-sensor1\":\"\",\"processor-header-graph\":true,\"storage-header-graph-width\":30,\"network-header-bars\":false,\"processor-source-load-avg\":\"auto\",\"network-menu-arrow-color1\":\"rgba(29,172,214,1.0)\",\"network-source-top-processes\":\"auto\",\"gpu-header-icon\":true,\"processor-menu-graph-breakdown\":true,\"storage-ignored\":\"[],\"sensors-header-icon-custom\":\"\",\"sensors-header-sensor2\":\"\",\"network-header-icon-alert-color\":\"rgba(235, 64, 52, 1)\",\"memory-header-tooltip-free\":false,\"storage-header-io-figures\":2,\"network-menu-arrow-color2\":\"rgba(214,29,29,1.0)\",\"sensors-header-tooltip-sensor3-name\":\"\",\"network-source-public-ipv6\":\"https:api6.ipify.org\",\"monitors-order\":\"\",\"network-header-graph\":true,\"network-indicators-order\":\"\",\"memory-header-percentage\":false,\"gpu-data\":\"\",\"storage-header-bars\":true,\"processor-header-tooltip\":true,\"memory-menu-swap-color\":\"rgba(29,172,214,1.0)\",\"storage-io-unit\":\"kB/s\",\"memory-header-graph-width\":30,\"processor-header-graph-color1\":\"rgba(29,172,214,1.0)\",\"sensors-header-tooltip-sensor5-digits\":-1,\"gpu-header-icon-custom\":\"\",\"gpu-header-icon-size\":18,\"panel-margin-right\":0,\"processor-header-frequency\":false,\"processor-header-graph-breakdown\":true,\"sensors-header-tooltip-sensor3-digits\":-1,\"processor-source-cpu-usage\":\"auto\",\"memory-header-value-figures\":3,\"compact-mode\":false,\"processor-header-frequency-mode\":\"average\",\"panel-box-order\":0,\"compact-mode-compact-icon-custom\":\"\",\"network-header-graph-width\":30,\"gpu-header-tooltip\":true,\"sensors-header-icon\":true,\"gpu-header-activity-percentage-icon-alert-threshold\":0,\"sensors-header-sensor2-digits\":-1,\"processor-header-graph-color2\":\"rgba(214,29,29,1.0)\",\"sensors-header-icon-alert-color\":\"rgba(235, 64, 52, 1)\",\"sensors-update\":3,\"gpu-header-tooltip-memory-value\":true,\"processor-header-bars\":false,\"gpu-header-tooltip-memory-percentage\":true,\"gpu-header-memory-bar-color1\":\"rgba(29,172,214,1.0)\",\"sensors-header-tooltip-sensor1\":\"\",\"sensors-header-tooltip-sensor1-digits\":-1,\"storage-header-free-figures\":3,\"processor-header-percentage-core\":false,\"sensors-header-tooltip-sensor2-name\":\"\",\"network-source-network-io\":\"auto\",\"memory-header-bars\":true,\"processor-header-percentage\":false,\"processor-header-frequency-figures\":3,\"storage-header-io-threshold\":0,\"memory-header-graph-color1\":\"rgba(29,172,214,1.0)\",\"compact-mode-activation\":\"both\",\"storage-header-icon-size\":18,\"sensors-header-tooltip-sensor1-name\":\"\",\"sensors-header-icon-size\":18,\"sensors-header-icon-color\":\"\",\"explicit-zero\":false,\"sensors-source\":\"auto\",\"storage-header-io-graph-color1\":\"rgba(29,172,214,1.0)\",\"storage-header-percentage-icon-alert-threshold\":0,\"sensors-header-tooltip-sensor2\":\"\",\"compact-mode-expanded-icon-custom\":\"\",\"memory-header-graph-color2\":\"rgba(29,172,214,0.3)\",\"processor-header-icon-alert-color\":\"rgba(235, 64, 52, 1)\",\"processor-header-tooltip-percentage\":true,\"gpu-header-show\":false,\"network-update\":1.5,\"sensors-header-tooltip-sensor3\":\"\",\"sensors-ignored-attribute-regex\":\"\",\"memory-header-icon-custom\":\"\",\"storage-header-tooltip-io\":true,\"sensors-header-tooltip-sensor4\":\"\",\"storage-header-percentage\":false,\"sensors-temperature-unit\":\"celsius\",\"storage-header-icon-alert-color\":\"rgba(235, 64, 52, 1)\",\"storage-header-free-icon-alert-threshold\":0,\"memory-source-top-processes\":\"auto\",\"storage-header-value-figures\":3,\"storage-header-io-bars-color1\":\"rgba(29,172,214,1.0)\",\"storage-menu-arrow-color1\":\"rgba(29,172,214,1.0)\",\"gpu-header-tooltip-activity-percentage\":true,\"network-header-icon-custom\":\"\",\"processor-header-graph-width\":30,\"network-header-icon\":true,\"storage-menu-arrow-color2\":\"rgba(214,29,29,1.0)\",\"sensors-header-sensor2-layout\":\"vertical\",\"sensors-header-tooltip-sensor5\":\"\",\"memory-header-bars-breakdown\":true,\"sensors-header-show\":true,\"sensors-header-tooltip\":false,\"storage-header-tooltip\":true,\"processor-header-bars-core\":false,\"storage-indicators-order\":\"\"\",\"processor-menu-bars-breakdown\":true,\"storage-header-io-bars-color2\":\"rgba(214,29,29,1.0)\",\"network-io-unit\":\"kB/s\",\"storage-header-icon\":true,\"gpu-header-activity-graph-color1\":\"rgba(29,172,214,1.0)\",\"memory-unit\":\"kB-KB\",\"processor-menu-core-bars-breakdown\":true,\"sensors-header-sensor2-show\":false,\"network-header-tooltip\":true,\"storage-header-tooltip-free\":true,\"storage-header-bars-color1\":\"rgba(29,172,214,1.0)\",\"theme-style\":\"dark\",\"storage-source-storage-usage\":\"auto\",\"network-header-io\":false,\"storage-header-tooltip-value\":false,\"storage-main\":\"[default]\",\"memory-header-tooltip-percentage\":true,\"memory-indicators-order\":\"\",\"memory-source-memory-usage\":\"auto\",\"memory-header-graph-breakdown\":false,\"memory-header-tooltip-value\":true,\"memory-menu-graph-breakdown\":true,\"sensors-indicators-order\":\"\",\"compact-mode-start-expanded\":false,\"startup-delay\":2,\"memory-header-percentage-icon-alert-threshold\":0,\"sensors-header-sensor1-show\":false,\"network-ignored-regex\":\"\",\"storage-update\":3,\"memory-header-value\":false,\"memory-header-bars-color1\":\"rgba(29,172,214,1.0)\",\"network-header-io-graph-color1\":\"rgba(29,172,214,1.0)\",\"gpu-header-memory-bar\":true,\"memory-used\":\"total-free-buffers-cached\",\"gpu-header-memory-graph-width\":30,\"gpu-header-memory-graph\":false,\"sensors-ignored-category-regex\":\"\",\"headers-font-family\":\"\",\"memory-header-icon\":true,\"memory-header-bars-color2\":\"rgba(29,172,214,0.3)\",\"network-header-io-graph-color2\":\"rgba(214,29,29,1.0)\",\"processor-gpu\":true,\"network-header-icon-color\":\"\",\"storage-header-value\":false,\"gpu-header-icon-alert-color\":\"rgba(235, 64, 52, 1)\",\"processor-header-icon\":true,\"headers-font-size\":0,\"network-header-io-figures\":2,\"network-header-show\":true,\"sensors-ignored-regex\":\"\",\"network-header-io-bars-color1\":\"rgba(29,172,214,1.0)\",\"processor-update\":1.5,\"network-source-wireless\":\"auto\",\"processor-indicators-order\":\"\",\"storage-header-icon-custom\":\"\",\"gpu-header-activity-bar\":true,\"gpu-header-activity-bar-color1\":\"rgba(29,172,214,1.0)\",\"shell-bar-position\":\"top\",\"network-ignored\":\"\",\"network-header-io-bars-color2\":\"rgba(214,29,29,1.0)\",\"memory-header-icon-color\":\"\",\"sensors-header-sensor1-digits\":-1,\"storage-header-io-layout\":\"vertical\",\"memory-header-icon-size\":18,\"network-header-io-threshold\":0,\"storage-header-show\":true,\"sensors-header-tooltip-sensor4-digits\":-1,\"processor-header-percentage-icon-alert-threshold\":0,\"memory-header-tooltip\":true,\"headers-height-override\":0,\"memory-header-graph\":false,\"network-header-icon-size\":18,\"gpu-header-icon-color\":\"\",\"memory-header-free-figures\":3,\"processor-header-bars-breakdown\":true,\"gpu-header-activity-graph\":false,\"storage-header-io-bars\":false,\"memory-header-icon-alert-color\":\"rgba(235, 64, 52, 1)\",\"storage-header-free\":false,\"processor-header-icon-custom\":\"\",\"gpu-header-memory-percentage\":false,\"processor-header-tooltip-percentage-core\":false,\"processor-source-cpu-cores-usage\":\"auto\",\"processor-source-top-processes\":\"auto\",\"processor-header-icon-color\":\"\",\"sensors-header-tooltip-sensor5-name\":\"\",\"gpu-header-activity-graph-width\":30,\"gpu-header-activity-percentage\":false,\"gpu-indicators-order\":\"\",\"network-header-io-layout\":\"vertical\",\"gpu-update\":2,\"gpu-header-memory-percentage-icon-alert-threshold\":0,\"processor-header-bars-color1\":\"rgba(29,172,214,1.0)\",\"processor-header-show\":true,\"storage-header-graph\":false,\"memory-header-free-icon-alert-threshold\":0,\"storage-ignored-regex\":\"\",\"storage-menu-device-color\":\"rgba(29,172,214,1.0)\",\"storage-header-tooltip-percentage\":true,\"memory-header-free\":false,\"storage-source-top-processes\":\"auto\"}}";
      };
*/

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
} # end:q

