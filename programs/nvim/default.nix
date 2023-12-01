{pkgs, ...}:

{
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
    vim.cmd("set nocompatible")
    vim.cmd("set showmatch")
    vim.cmd("set tabstop=4")
    vim.cmd("set expandtab")
    vim.cmd("set shiftwidth=4")
    vim.cmd("set wildmode=longest,list")
    vim.cmd("set cc=80")
    vim.cmd("set cursorline")
    vim.cmd("set clipboard=unnamedplus")
    vim.cmd("set ttyfast")
    vim.cmd("let mapleader = \",\" ")
    vim.cmd("inoremap jk <ESC> " )
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
    require("lazy").setup(
    {
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
            end
        },
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000
        }
    })
    vim.cmd("colorscheme tokyonight")
  '';
  
  };


} 
