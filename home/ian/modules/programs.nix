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

/*  # git
    git = {
      enable = true;
      userName = "ian";
      userEmail = "iansyd@gmail.com";
      ignores = [
        "#ignore temp files"
        "*~""
        "*.swp"
        "tempfile"
        "*.kate-swp"
        "# Ignore build outputs from performing a nix-build or `nix build` command"
        "result"
        "result-*"
        "# Ignore automatically generated direnv output"
        ".direnv"
       ];
    };
*/

    #Inst"all Neovim and the default editor
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
