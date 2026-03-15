{ pkgs, ... } :
{
  programs.aider-chat = {
    enable = true;
    settings = {
      model = "gemini";
      dark-mode = true;
      editor = "nvim";
      auto-commits = true;
      attribute-author = true;
      attribute-commit-message-author = true;
      # change these to true once set up
      auto-lint = false;
      lint-cmd = "npm run lint";
      auto-test = false;
      test-cmd = "npm run test";
      gitignore = true;
      map-tokens = 1024; # relates to mappnig the project structure; might need to be larger
    };
  };
}

