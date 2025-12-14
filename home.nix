{ config, pkgs, ... }:

{
  # Informações do usuário
  home.username = "kyu";
  home.homeDirectory = "/home/kyu";

  # Versão do state - NÃO ALTERE após primeira instalação
  home.stateVersion = "25.11";

  # Configuração do cursor Bibata
  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  # Configuração do shell Zsh
  programs.zsh = {
  enable = true;
  defaultKeymap = "emacs";
  
  shellAliases = {
    ll = "ls -la";
  };
  
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "docker" "colored-man-pages" ];
    theme = "robbyrussell";
  };
  };

  # GTK
  gtk = {
    enable = true;

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "gruvbox-dark";
    };
  };

  # QT
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gruvbox-dark";
  };

  # Variáveis de ambiente
  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };

  # Home Manager auto-gerenciamento
  programs.home-manager.enable = true;

}
