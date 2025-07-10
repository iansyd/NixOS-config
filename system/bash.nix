{ pkgs, userSettings, ... }:

{
  environment.systemPackages = with pkgs; [
    bash
    bash-completion
  ];

  programs.bash = {
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      flakeup = "nix flake update --flake " + userSettings.dotfilesDir;
      nixup = "sudo nixos-rebuild switch --flake " + userSettings.dotfilesDir;
      nixtest = "sudo nixos-rebuild test --flake " + userSettings.dotfilesDir;
      homeup = "home-manager switch --flake " + userSettings.dotfilesDir;
      flakeed = "vim " + userSettings.dotfilesDir + "/flake.nix";
      nixed = "vim " + userSettings.dotfilesDir + "/configuration.nix";
      homeed = "vim " + userSettings.dotfilesDir + "/home.nix";
    };
  };
}
