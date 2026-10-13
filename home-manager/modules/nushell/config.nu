use ./scripts/rust.nu
# use python.nu *
use scripts/emblica.nu *
use scripts/sanoma.nu *
use scripts/kubectl.nu *
use scripts/secret.nu *

alias archive = /usr/bin/zip

$env.PATH ++= [
  /nix/var/nix/profiles/default/bin
  ~/.nix-profile
  ~/.nix-profile/bin/
]

# Zoxide for better cd
source ~/.config/zoxide.nu
alias cd = z

source ./scripts/starship.nu
# source ./gruvbox.nu
source ./scripts/everforest.nu
$env.config.hooks.env_change.PWD = ($env.config.hooks.env_change.PWD | append (source ./direnv.nu))

$env.config.color_config = $everforest_theme
$env.config.show_banner = false
# nvim presumably installed though nix, so sudoedit cannot find it
# from regular path?
$env.SUDO_EDITOR = (which nvim | get path | first)
