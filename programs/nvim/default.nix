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
     require("lazy").setup({
         "toppair/peek.nvim",
         event = { "VeryLazy" },
         build = "deno task --quiet build:fast",
         config = function()
           require("peek").setup({
	     app = 'chromium'})
           -- refer to `configuration to change defaults`
           vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
           vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
      end,
      }
      
      )
    '';
  }; 
}
