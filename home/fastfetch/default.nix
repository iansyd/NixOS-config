{
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        color = {
          keys = "35";
          output = "95";
        };
        separator = " ➜  ";
      };

      logo = {
        source = ./nixos-logo.png;
        type = "auto";
        height = 10;
        width = 20;
        padding = {
          top = 2;
          left = 2;
        };
      };

      modules = [
        "break"
        {
          type = "os";
          key = "OS";
          keyColor = "31";
        }
        {
          type = "kernel";
          key = " ├  kernel  ";
          keyColor = "31";
        }
        {
          type = "packages";
          key = " ├ 󰏖 packages";
          keyColor = "31";
        }
        {
          type = "shell";
          key = " └  shell   ";
          keyColor = "31";
        }
        "break"
        {
          type = "wm";
          key = "WM   ";
          keyColor = "32";
        }
        {
          type = "wmtheme";
          key = " ├ 󰉼 wmtheme ";
          keyColor = "32";
        }
        {
          type = "icons";
          key = " ├ 󰀻 icons   ";
          keyColor = "32";
        }
        {
          type = "cursor";
          key = " ├  cursor  ";
          keyColor = "32";
        }
        {
          type = "terminal";
          key = " ├  terminal";
          keyColor = "32";
        }
        {
          type = "terminalfont";
          key = " └  font    ";
          keyColor = "32";
        }
        "break"
        {
          type = "host";
          format = "{5} {1} Type {2}";
          key = "PC   ";
          keyColor = "33";
        }
        {
          type = "cpu";
          format = "{1} ({3}) @ {7} GHz";
          key = " ├  cpu     ";
          keyColor = "33";
        }
        {
          type = "gpu";
          format = "{1} {2} @ {12} GHz";
          key = " ├ 󰢮 gpu     ";
          keyColor = "33";
        }
        {
          type = "memory";
          key = " ├  memory  ";
          keyColor = "33";
        }
        {
          type = "disk";
          key = " ├ 󰋊 disk    ";
          keyColor = "33";
        }
        {
          type = "monitor";
          key = " ├  monitor ";
          keyColor = "33";
        }
        {
          type = "player";
          key = " ├ 󰥠 player  ";
          keyColor = "33";
        }
        {
          type = "media";
          key = " ├ 󰝚 media   ";
          keyColor = "33";
        }
        {
          type = "locale";
          key = " ├ 🌐locale  ";
          keyColor = "33";
        }
        {
          type = "localip";
          key = " ├ 🖧 IP      ";
          keyColor = "33";
        }
        {
          type = "uptime";
          key = " └ 🏃Uptime  ";
          keyColor = "33";
        }
      ];
    };
  };
}
