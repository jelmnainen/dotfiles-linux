{ pkgs, config, inputs, ... }:

{
  programs.anyrun = {
    enable = true;

    config = {
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
        inputs.anyrun.packages.${pkgs.system}.dictionary
        inputs.anyrun.packages.${pkgs.system}.rink # This is the calculator!
      ];

      # Positioning and sizing
      width = { fraction = 0.3; };
      y = { absolute = 15; };
      hidePluginInfo = true;
      closeOnClick = true;
    };

    extraCss = ''
      * {
        font-family: "JetBrainsMono Nerd Font", "sans-serif";
        font-size: 1.2rem;
      }
      #window {
        background-color: transparent;
      }
      box#main {
        background-color: rgba(39, 46, 51, 0.85);
        border-radius: 8px;
        color: #D3C6AA;
      }
      list#main {
        background-color: transparent;
      }
    '';
  };
}
