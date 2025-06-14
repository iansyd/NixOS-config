{ inputs, ... }:

{
  programs = {

    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    # enable github cli
    gh.enable = true;

    btop.enable = true;

    # Trying to get command-not-found to work
    command-not-found.enable = false;
    nix-index-database.comma.enable = true;
    nix-index = {
      enable = true;
      enableFishIntegration = true;
      #enableBashIntegration = true;
    };

    
    #Install Neovim as the default editor
    neovim = {
      enable = true;
      defaultEditor = true;
      extraConfig =
        ''
        set number
        set ruler
        ''
      ;
    };

  };
}
