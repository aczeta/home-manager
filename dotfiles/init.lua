-- NVIm Config in Lua

-- Basic Config
vim.cmd("syntax on")             -- enable syntax highlighting
vim.cmd("set hlsearch")          -- highlight all search results
vim.cmd("set incsearch")         -- show increamental search results as you type
vim.cmd("set number")            -- display line number
vim.cmd("set noswapfile")        -- disable swapfile
vim.cmd("let mapleader = \"'\"") -- remap leader to "'"
vim.cmd("inoremap jk <ESC>")     -- remap escape to jk
vim.cmd("set nocompatible")      -- disable compatibility to old-time vi
vim.cmd("set showmatch")         -- show matching
vim.cmd("set tabstop=4")         -- number of columns occupied by a tab
vim.cmd("set softtabstop=4")     -- see multiple spaces as tabstops for <BS>
vim.cmd("set expandtab")         -- converts tabs to whitespace
vim.cmd("set autoindent")        -- indent a new line the same amount as prev.
vim.cmd("set wildmode=longest,list") -- get bash-like tab completion
vim.cmd("set cc=80")             -- set an 80 column border for good style
vim.cmd("set cursorline")        -- highlight current cursorline
vim.cmd("set clipboard=unnamedplus") -- use system clipboard
vim.cmd("set ttyfast")           -- speed up scrolling
--bootstrap lazy
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

require("lazy").setup("plugins")

-- setup colorscheme
vim.cmd("colorscheme tokyonight")

-- setup lsp config
require("lspconfig")
