{
  username,
  email,
  dotfilesDir,
  ...
}:
#let
#  inherit (import ../variables.nix) username email dotfilesDir;
#in
{
  # git
  programs.git = {
    enable = true;
    userName = username;
    userEmail = email;
    ignores = [
      "#ignore temp files"
      "*~"
      "*.swp"
      "tempfile"
      "*.kate-swp"

      "# Ignore build outputs from performing a nix-build or `nix build` command"
      "result"
      "result-*"

      "# Ignore automatically generated direnv output"
      ".direnv"
    ];
    extraConfig = {
      init.defaultBranch = "main";
      safe.Directory = dotfilesDir;
    };
  };
}
