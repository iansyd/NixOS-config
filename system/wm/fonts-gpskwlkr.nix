{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    font-awesome 
    jetbrains-mono


    #(nerd-fonts.override { fonts = [ "JetBrainsMono" ]; })
    nerd-fonts.jetbrains-mono
  ];
}
