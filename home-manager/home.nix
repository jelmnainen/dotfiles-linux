{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/anyrun.nix # app launcher
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "johannes";
  home.homeDirectory = "/home/johannes";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "Inter" ];
      serif = [ "Merriweather" ];
    };
  };
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.tree-sitter
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.bat
    pkgs.zoxide
    pkgs.starship
    pkgs.eww
    inputs.snappy-switcher.packages.${pkgs.system}.default

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    ncspot = {
      enable = true;
      settings = {
        backend = "pulseaudio";
      };
    };

  };

  programs.nushell = {
    enable = true;
    shellAliases = {
      spotify = "ncspot";
    };
    extraConfig = builtins.readFile ./modules/nushell/config.nu;
  };
  xdg.configFile."nushell/scripts".source = ./modules/nushell/scripts;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".config/snappy-switcher/config.ini" = {
      source = dotfiles/snappy-switcher/config.ini;
      force = true;
    };

    ".config/snappy-switcher/everforest.ini" = {
      source = dotfiles/snappy-switcher/everforest.ini;
      force = true;
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/johannes/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
