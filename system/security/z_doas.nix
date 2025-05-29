# Not used as it seems to cause problems with some git functions. Using sudo instead.
{ userSettings, pkgs, ... }:

{
  # Doas instead of sudo
  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [
    {
      users = [ "${userSettings.username}" ];
      keepEnv = true;
      persist = true;
    }
    {
      users = [ "${userSettings.username}" ];
      cmd = "tee";
      noPass = true;
    }
  ];

  environment.systemPackages = [
    (pkgs.writeScriptBin "sudo" ''exec doas "$@"'')
  ];
}
