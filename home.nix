{ config, pkgs, ... }:

{
  # import packages
  imports = [
      ./programs/nvim
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "aczet";
  home.homeDirectory = "/home/aczet";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # collection of programs without generated configuration
  home.packages = [
    pkgs.gh   
    pkgs.ripgrep
    pkgs.jq
    pkgs.yq-go
    pkgs.fzf
    pkgs.chromium
    pkgs.deno
    pkgs.fd 
  ];
  # Install git
  programs.git = {
    enable = true;
    userName = "Allan Zeta";
    userEmail = "aczeta180@gmail.com";
    lfs = {
      enable = true;
      };
    };
  # Install and configure bash
  programs.bash = {
    enable = true;
    sessionVariables = {
      EDITOR = "nvim";
      };
    enableCompletion = true;
    }; 
  # Install and configure starship.rs
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    };
          
  # Install and configure eza
  programs.eza = {
    enable = true;
    enableAliases = true;
    icons = true;
    git = true;
    extraOptions = [ "--long"];
    };
  # Install and configure zoxide
  programs.zoxide = {
    enable = true;
  };
}
