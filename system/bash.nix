{ pkgs, dotfilesDir, ... }:
{
  environment.systemPackages = with pkgs; [
    bash
    bash-completion
  ];

  programs.bash = {
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      flakeup = "nix flake update --flake " + dotfilesDir;
      nixup = "sudo nixos-rebuild switch --flake " + dotfilesDir;
      nixtest = "sudo nixos-rebuild test --flake " + dotfilesDir;
      homeup = "home-manager switch --flake " + dotfilesDir;
      flakeed = "vim " + dotfilesDir + "/flake.nix";
      nixed = "vim " + dotfilesDir + "/configuration.nix";
      homeed = "vim " + dotfilesDir + "/home.nix";
    };
  };
}
