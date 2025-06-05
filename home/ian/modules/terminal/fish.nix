{ pkgs, ... }:

{
  programs = {
    fish = {
      enable = true;
      package = pkgs.fish;
      shellAbbrs = {
        ".." = "cd ..";
        flakeed = "nvim ~/dotfiles/flake.nix";
        flakeup = "nix flake update --flake ~/dotfiles";
        homeed = "nvim ~/dotfiles/home.nix";
        homeup = "home-manager switch --flake ~/dotfiles";
        ll = "ls -l";
        nixed = "nvim ~/dotfiles/configuration.nix";
        nixup = "sudo nixos-rebuild switch --flake ~/dotfiles";
        nixuptest = "sudo nixos-rebuild test --flake ~/dotfiles";
        vim = "nvim";
        v = "nvim";
      };
      shellInitLast = "neofetch";
      functions = {
        gitsave = ''
          if count $argv > /dev/null
            echo "...cd ~/dotfiles"
            cd ~/dotfiles
            echo "...git add ."
            git add .
            echo "...git commit -m $argv"
            git commit -m $argv
            echo "...git push NixOS-config main"
            git push NixOS-config main
          else
            echo "**Error - missing message. Use git add . "message re this commit"
          end
        '';

        fish_prompt = ''
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
    };
  };
}
