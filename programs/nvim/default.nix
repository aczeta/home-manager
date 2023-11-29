{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    extraLuaConfig = ''
      vim.cmd("syntax on")
      vim.cmd("set hlsearch")
      vim.cmd("set ignorecase")
      vim.cmd("set incsearch")
      vim.cmd("set number")
      vim.cmd("set noswapfile")
      vim.cmd("let mapleader = \"'\" ")
      vim.cmd("inoremap jk <ESC>") 
    '';
  }; 
}
