Git Commands Summary/Learning
=============================


Basic Command
-------------

# What version of git do I have?
$ which git
Or
$ git --version

# commit
$ git commit -m "Commit description"

# push
$ git push github main


### Pushing to GIT
a. Staging:     $ git add .
b. Commit:      $ git commit -m "<message>"
   where <message> is a short description of the reason for the change
c. Push:        $ git push <name> main
   where <name> is same as step 3
(Authentication check will be required for the first upload)

### restoring from git
$ cd ~/.dotfiles
$ git clone <link> . # where <link> is the github link as in step 3. c.
Alternatively can use $ git pull <name> main  
The upload may have been remaned from main to orign. Check with
$ git remote # it will probably be origin change with ...
$ git remote remove origin
$ git remote add github <link> # with link as per above

## Notes on a gotcha
if a new file is added into the home-manager directory and it has never been staged
then an error will pop up when you attempt to update home-manager with
$home-manager switch --flake .
To fix this the new file  must be added using
$ git add <addedfile>

Setting up a git repo on github
-------------------------------

Based on video at https://www.youtube.com/watch?v=20BN4gqHwaQ&t=121s

1. Create an SSH key on your PC
```
ssh-keygen -t rsa
```
(I used a blank passphrase)
This generates a private key in ~/.ssh/id_rsa & a public key in ~/.ssh/id_rsa.pub

2. Create a git repo
login to git
Create an SSH key. On github...
a. In the upper-right corner of any page on GitHub, click your profile photo, then click Settings
b. In the "Access" section of the sidebar, click "SSH and GPG keys"
c. Click "New SSH key" or "Add SSH key"
d. Give it a "Title" that explains how the key will be used
e. Select the "key type" of Authentication Key
e. Copy the key from the file ~/.ssh/????.pub (generated in step 1) into the "key" field.
f. Click on "Add SSH key"
g. Create a repo (dropdown create new)
h. Give it a name, and make it private with no readme, then click "create repository"

3. Set up on the PC
a. on github within the created repo select code>local>SSH
b. and copy the github link - something like "git@github.com:iansyd/NixOS-config.git"
c. create a folder for the repository and set it as a git repo e.g.
```
mkdir myrepo
cd myrepo
git init
```
d. Create a link to the remote repo i.e. git remote add <name> <link> 
 where <name> is something you choose and <link> is the git url from step b above then commit and push  e.g.
```
git remote add NixOS-config git@github.com:iansyd/NixOS-config.git
git add .
git commit -m "initial"
git push github main
```
(Authenticiation check will be required for the first upload)
