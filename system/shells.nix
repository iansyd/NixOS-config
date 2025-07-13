{ pkgs, ... }:

{
  environment.shells = with pkgs; [
    bash
    zsh
    fish
  ];
  users.defaultUserShell = pkgs.bash;
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = "fastfetch";
      promptInit = ''
        # This is a simple prompt. It looks like
        # alfa@nobby /path/to/dir $
        # with the path shortened and colored
        # and a "#" instead of a "$" when run as root.
        set -l symbol ' $ '
        set -l color $fish_color_cwd
        if fish_is_root_user
            set symbol ' # '
            set -q fish_color_cwd_root
            and set color $fish_color_cwd_root
        end

        echo -n $USER@$hostname

        set_color $color
        echo -n (prompt_pwd)
        set_color normal

        echo -n $symbol
      '';
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      interactiveShellInit = "fastfetch";
      syntaxHighlighting = {
        enable = true;
        highlighters = [
          "main"
          "brackets"
          "pattern"
          "regexp"
          "root"
          "line"
        ];
      };
    };
    bash = {
      enableLsColors = true;
      completion.enable = true;
      interactiveShellInit = "fastfetch";
    };
  };
}
