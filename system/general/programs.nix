{ config, pkgs, ... }: 

{
programs = {

    # Install firefox.
    firefox.enable = true;

    #Install Neovim and the default editor
    neovim = {
      enable = true;
      defaultEditor = true;
    };

    # htop
    htop.enable = true;

};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
