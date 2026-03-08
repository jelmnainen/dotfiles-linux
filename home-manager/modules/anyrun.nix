{ pkgs, config, inputs, ... }:

{
  programs.anyrun = {
    enable = true;

    config = {
      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
        "${pkgs.anyrun}/lib/libdictionary.so"
        "${pkgs.anyrun}/lib/librink.so"
      ];

      width = { absolute = 600; };
      y = { absolute = 15; };
      hidePluginInfo = true;
      closeOnClick = true;
    };
    extraCss = ''
          * {
            font-family: "JetBrainsMono Nerd Font", "sans-serif";
            font-size: 1.2rem;
          }

          /* Make the base window transparent */
          window {
            background: transparent;
          }

          /* The actual floating box */
          box.main {
            background: rgba(39, 46, 51, 0.95);
            border: 2px solid #A7C080;
            border-radius: 12px;
            padding: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.5);
          }

          /* The text input field */
          text {
            background: rgba(45, 53, 59, 0.95);
            border-radius: 8px;
            padding: 8px 12px;
            color: #D3C6AA;
            margin-bottom: 12px;
          }

          /* The list of results wrapper */
          box.matches {
            background: transparent;
          }

          /* An individual result row */
          box.match {
            padding: 8px;
            border-radius: 6px;
            color: #D3C6AA;
          }

          /* The highlighted result */
          box.match:selected {
            background: #A7C080;
            color: #272E33;
          }

          label {
            color: inherit;
          }
        '';
  };
}
