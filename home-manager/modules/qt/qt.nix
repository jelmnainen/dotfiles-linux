
{ config, pkgs, ... }:
{
  xdg.configFile."qt5ct.conf".source = ./qt5ct.conf;
  xdg.configFile."qt6ct.conf".source = ./qt6ct.conf;
  xdg.configFile."Kvantum/kvantum.kvconfig".source = ./kvantum.kvconfig;
  xdg.configFile."Kvantum/MateriaEverforestDark".source = ./MateriaEverforestDark;
}
