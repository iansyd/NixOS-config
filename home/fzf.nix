  { config, lib, ... }:
let
  accent = "#8f8f8f";
  foreground = "#e2e2e2" ;
  muted = "#9b9b9b";
in
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = lib.mkForce {
      "fg+" = accent;
      "bg+" = "-1";
      "fg" = foreground;
      "bg" = "-1";
      "prompt" = muted;
      "pointer" = accent;
    };
    defaultOptions = [
      "--margin=1"
      "--layout=reverse"
      "--border=none"
      "--info='hidden'"
      "--header=''"
      "--prompt='/ '"
      "-i"
      "--no-bold"
      "--bind='enter:execute(nvim {})'"
      "--preview='bat --style=numbers --color=always --line-range :500 {}'"
      "--preview-window=right:60%:wrap"

    ];
  };
}
