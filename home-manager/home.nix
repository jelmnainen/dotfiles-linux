{ config, pkgs, inputs, ... } :
let
  everofrest_colors = {
    foreground = "#D3C6AA";
    red = "#E67E80";
    yellow = "#DBBC7F";
    green = "#A7C080";
    blue = "#7FBBB3";
    purple = "#D699B6";
    aqua = "#83C092";
    orange = "#E69875";
    background_0 = "#272E33";
    background_1 = "#2E383C";
    background_2 = "#374145";
    background_3 = "#414B50";
    background_4 = "#495156";
    background_5 = "#4F5B58";
  };
in
{
  # Inject the color scheme to all modules
  _module.args.themeColors = everofrest_colors;
  imports = [
    ./modules/rofi/rofi.nix # app launcher
    ./modules/qt/qt.nix
    ./modules/aider/aider.nix
    inputs.niri.homeModules.config
    ./niri.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "johannes";
    homeDirectory = "/home/johannes";
    stateVersion = "25.11"; # Please read the comment before changing.
  };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.

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
    pkgs.imagemagick # CLI image manipulation
    pkgs.ffmpegthumbnailer # video thumbnailer
    pkgs.direnv
    pkgs.devenv
    pkgs.poppler # headless PDF rendering
    pkgs.swaybg

    pkgs.spotify

    # try to enable add X11 compatibility for clipboard
    pkgs.xclip

    # Global programming language setups
    pkgs.nodejs
    pkgs.beancount
    pkgs.fava
    pkgs.statix
    pkgs.jq
    pkgs.p7zip

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

    yazi = {
      enable = true;
      plugins = {
        bookmarks = pkgs.yaziPlugins.bookmarks;
      };
      initLua = ''
        require("bookmarks"):setup({
          persist = "all",
          desc_format = "full",
          notify = {
            enable = true,
            timeout = 3,
            message = {
              new = "New bookmark '<key>' -> '<folder>'",
              delete = "Deleted bookmark binded to '<key>'"
            }
          }
        })
        '';
      keymap = {
        mgr = {
          prepend_keymap = [
            {
              on = [ "M" ];
              run = "plugin bookmarks save";
              desc = "Save current position as bookmark";
            }
            {
              on = [ "'" ];
              run = "plugin bookmarks jump";
              desc = "Jump to a bookmark";
            }
            {
              on = [ "b" "d" ];
              run = "plugin bookmarks delete";
              desc = "Delete a bookmark";
            }
          ];
        };
      };
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

    ".config/snappy-switcher/themes/everforest.ini" = {
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
