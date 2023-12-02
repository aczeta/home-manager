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

-- taken from suggested configuration from nvim-lspconfig
-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {}
lspconfig.nixd.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

