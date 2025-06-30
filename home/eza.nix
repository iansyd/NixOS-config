{
  programs.eza = {
    enable = true;
    icons = "auto";
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    git = true;


    extraOptions = [
      "--group-directories-first"
      "--no-quotes"
      "--header"
      "--classify"
      "--hyperlink"
      "--git-ignore"
      "--icons=always"
    ];
  };
}
