{ config, pkgs, themeColors, ... }:
let
  rawRasi = builtins.readFile ./theme.rasi;
  templatedRasi = builtins.replaceStrings
    [
      "@nix-bg@"
      "@nix-bg-light@"
      "@nix-border@"
      "@nix-selected@"
      "@nix-fg@"
      "@nix-fg2@"
    ]
    [
      themeColors.background_0
      themeColors.background_5
      themeColors.green
      themeColors.green
      themeColors.foreground
      themeColors.yellow
    ]
    rawRasi;
  everforestTheme = pkgs.writeText "everforest.rasi" templatedRasi;
in
{
  programs.rofi = {
    enable = true;

    font = "${builtins.head config.fonts.fontconfig.defaultFonts.monospace} 12";

    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      icon-theme = "Zafiro-Icons-Dark";
      drun-display-format = "{icon} {name}";
      disable-history = false;
      max-history-size = 25;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 󰕰  Window ";
      matching = "fuzzy";
      sort = true;
    };

    theme = "${everforestTheme}";
  };
}

