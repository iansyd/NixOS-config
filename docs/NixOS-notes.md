NixOS Learnings
================

## Temporary Installation

Temporary Installation
----------------------

To add a program for use in a shell - e.g. to add the cowsay and lolcat packages...
```
nix-shell -p cowsay lolcat
```

Ctrl-D to exit the shell - and therefor no longer have access to the package.

Or even quicker to run it once - load then run the package...
```
nix-shell -p cowsay --run "cowsay Nix"
```

Check what version of a program is installed
--------------------------------------------

To check that you have a packjage, and its version - e.g. to check for git
Method 1:
```
which git
```
Method 2:
```
git --version
```

Basic/Original system configuration in /etc/nixos/
--------------------------------------------------

This section now superceeded. Use the flake version below

Record System configuration in /etc/nixos/configuration.nix and edit it with:
```
sudo vim /etc/nixos/configuration.nix
```

After modifying entries in /etc/nixos/configuration.nix update the system by runing the command:
```
sudo nixos-rebuild switch
```


Managing Generations
--------------------

Some examples:
```
# To show stored generations
nixos-rebuild list-generations 

# To delete generations older than 30 days and any stored packages that are not linked to a remaining generation:
nix-collect-garbage --delete-older-than 30d

# To delete just stored packages not linked to remaining generations:
$ nix-collect-garbage

# To delete other user-specific generations for different things (e.g. home-manager):
$ nix-collect-garbage -d
```
dd



Software Management using Flakes
--------------------------------

Set up is recorded in ~/.dotfiles

```
# edit configuration:
sudo vim ~/.dotfiles/configuration.nix

# update configuration:
sudo nixos-rebuild switch --flake ~/.dotfiles

# update to latest software using a flake
nix flake update --flake ~/.dotfiles

# The above command only updates the flake. To update the system also use:
sudo nixos-rebuild switch --flake .

# To give a generation a specific name
NIXOS_LABEL="this is what I want it to be called" nixos-rebuild switch --flake .
```

HomeManager
-----------

To update homemanager
$ home-manager switch --flake ~/.dotfiles

To display homemanager generations
$ home-manager generations

To rollback to an earlier homemanger generation
Activate the selected one by adding "/activate" to the end of the generation path e.g.
$ nix/store/044vk3c5qir8jd7x91xzl2khh4mwlij3-home-manager-generation/activate


Fish Terminal
-------------

Aliases are called abbveviations. They are normally saved in the file
~/.config/fish/fish.config
.. but for me they are saved in
~/.dotfiles/fish/config.fish
and made live using home-manager

More complex scripts are normally saved as functions in the folder
~/.config/fish/functions
.. but for me they are saved in
~/.dotfiles/fish/functions
and made live using home-manager with a new line for each aded function

## Working with Nix files

Working with Nix files
----------------------

When wanting to set an option in multiple places and prioritise then...
As an example when setting an option called myOption...
Make sure that lib is included i.e. the Nix file starts with...
{ config, lib, pkgs, ... }:

Then
myOption = lib.mkForce value1;      // priority 50
myOption = value2;                  // priority 100
myOption = lib.mkDefault value3;    // priority 1000
myOption = lib.mkOverride 20 value4; //priority

Virtual Terminals
-----------------

Switch terminals with ctrl+alt+<function key>
F2 > graphical desktop
F1 & F3 to F7 > virtual desktop

Problems with blank app icons
=============================
This happens sometimes due to Nix linking to old app versions in the nix store. 
Fix by running this command to relink
$ sed -i 's/file:\/\/\/nix\/store\/[^\/]*\/share\/applications\//applications:/gi' \
  ~/.config/plasma-org.kde.plasma.desktop-appletsrc \
  && systemctl restart --user plasma-plasmashell

  
Onedrive
========
Method descrive in https://nixos.wiki/wiki/OneDrive

1. add to configuration.nix
      services.onedrive.enable = true;
2. $ onedrive # paste the return
3. $ systemctl --user enable onedrive@onedrive.service
4. $ systemctl --user start onedrive@onedrive.service
Options
5. $ systemctl --user status onedrive@onedrive.service # to check that the service is running
6. $ journalctl --user -t onedrive | less # to view the log

GREP
====
Used to find contents of files
$ grep -rn 'find me' /in/this/folder/or/subfolder


FIND
====
Used to find file names
$ find . -name filename


Reinstalling from Scratch using github configuration 
====================================================
Based on video at https://www.youtube.com/watch?v=20BN4gqHwaQ&t=121s

1. Set the SSH key on your PC - either by copying from a prior installation, or 
   creating a new one

Option A)
a, Create an SSH key on your PC
```
ssh-keygen -t rsa
```
(I used a blank passphrase)
This generates a private in ~/.ssh/id_rsa & a public key in ~/.ssh/id_rsa.pub
login to git
Create an SSH key. On github...
b. In the upper-right corner of any page on GitHub, click your profile photo, then click Settings
c. In the "Access" section of the sidebar, click "SSH and GPG keys"
d. Click "New SSH key" or "Add SSH key"
e. Give it a "Title" that explains how the key will be used
f. Select the "key type" of Authentication Key
g. Copy the key from the file ~/.ssh/????.pub (generated in step 1) into the "key" field.
h. Click on "Add SSH key"

or Option B)
a) copy the file from/to ~/.ssh/id_rsa.pub  
b) change the permissions of id_rsa to user only 

3. In a terminal...
a. Temporarily install git using nix-shell then move to the home directory i.e.
```
nix-shell -p git
git config --global user.email "iansyd@gmail.com"
git config --global user.name "IanS"
```

4. Clone the git repo
a. On GitHub, navigate to the main page of the repository.
b. Above the list of files, click Code.
c. Click on SSH.
d. Copy the path to the repo (something like git@github.com:iansyd/NixOS-config.git) to the clipboard.
e. In the terminal opened at step 3. call git clone using the repo path, then rename it as dotfiles e.g.
```
git clone git@github.com:iansyd/NixOS-config.git
mv NixOS-config dotfiles
```
f. When prompted type yes to accept the connection to github
g. Once it has been cloned then rename the cloned folder to dotfiles

5. Change channel
```
nix-channel --add https://nixos.org/channels/nixos-25.05
nix-channel --update
```


6. Update /etc/nixos/configuration.nix and rebuild
a. Add flakes to the file:
```
nix.settings.experimental-features = [
  "nix-command"
  "flakes"
];
```
b. Rename the host, e.g.
```
networking.hostName = "hpMiniG9"; # Define your hostname.
```
c. rebuild
```
sudo nixos-rebuild --update switch
```

7. Update the dotfile configuration files for this hardware
a. Replace/update the hardware-configuration.nix file in the dotfiles folder 
   with the machine generated one in /etc/nixos
b. Update the hostname and any other relevant info in ~/dotfiles/flake.nix
   - including the host name in the nixosConfigurations expression
c. Check, compare, and update the configuration.nix file in the dotfiles folder 
   with the machine generated one in /etc/nixos
   It may be worth opening the editor from a terminal after temporarily installing git:
```
nix-shell -p git
kate /etc/nixos/configuration.nix ~/dotfiles/hosts/<hostname>/default.nix
```
d. Correct the git repository name
```
cd ~/dotfiles
git remote remove origin
git remote add NixOS-config git@github.com:iansyd/NixOS-config.git
```
f.. Update git & rebuild
```
git add .
sudo nixos-rebuild switch --flake ~/dotfiles#<hostnamne>
home-manager switch --flake ~/dotfiles
```
h.. Update git
```
git commit -m "some relevant comment for the changes made"
git push NixOS-config main
```

7. Set up Brave Browser. I did not sort out how to do this declaritavly (if it is possible) so instead... 
a. Open Brave
b. Select the hamburger menu on top right
c. Select Settings
d. Select the hambuger menu on top left, then Sync
b. Set up sync to an existing account

8. Set up Edge Browser. I did not sort out how to do this declaritavly (if it is possible) so instead...
a. Install microsoft edge and teams from the flatpak repo
```
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install com.microsoft.Edge com.github.IsmaelMartinez.teams_for_linux
```
b. log out then back in again or rebuild the menu using
```
kbuildsycoca6
```
c. Open Edge
d. Set up sync to an existing (work) account

9. Set up Onedriver for personal files (does not work for business).
I did not sort out how to do this declaritavly (if it is possible) so instead... 
a. create a folder ~/OneDrive
b. Select menu item Utilities->Onedriver
c. Follow the prompts
This is not a sync client. Instead of syncing files, onedriver performs an on-demand download of files when your computer attempts to use them.

10. Add and configure KDE Krohnkite to enable tiling windows management
a. System Settings -> Windows Management -> Kwin Scripts
b. Get new -> search for Krohnkite
c. Install
d. Tick to activate


Configure panels and widgets to suit
To sort out - panel configurations etc in KDE

## Notes on a gotcha

if a new file is added into the home-manager directory and it has never been staged
then an error will pop up when you attempt to update home-manager with
$home-manager switch --flake .
To fix this the new file  must be added using
$ git add <addedfile>

## Action on getting an "is not owned by current user" message when using nixos-rebuild

If this happens then use the --use-remote-sudo option instead of sudo command, i.e.
$ nixos-rebuild switch --use-remote-sudo --flake .

To Do
=====

Revise dotfiles for different hosts

Sort out warning mesage related to nixpkgs.config 
```
ian profile: You have set either `nixpkgs.config` or `nixpkgs.overlays` while using `home-manager.useGlobalPkgs`.
This will soon not be possible. Please remove all `nixpkgs` options when using `home-manager.useGlobalPkgs`.
```




