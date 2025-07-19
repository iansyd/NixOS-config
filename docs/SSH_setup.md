# SSH Setup based on video at 
# https://www.youtube.com/watch?v=xIDT32H3H5w&t=302s


1. Create a public and private key
```
ssh-keygen
# don't use a passphrase
# info needed is public key
# probably in /home/<username>/.ssh/<id>.pub
```

2. Uncomment lines in standard configuration.nix
```
# Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
    
  # Enable firewall
  networking.firewall.enable = true
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  
  # in the user definition
  users.users.username = {
    ...
    openssh.authorizedKeys.keys=[ "<public key from step 1>" ];
    ...
  }
```

3. Rebuild and reboot
```
sudo nixos-rebuild switch ...
sudo reboot # for changes to  take effect
```

4. Get Ip address of the server using
```
ip -a
```

5. To connect on the client
```
ssh <user>@><ip>
