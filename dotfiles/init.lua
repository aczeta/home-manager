-- bootstrap lazy
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
require("keys")
require("opts")
require("lazy").setup("plugins")
require("colorscheme")
require('lsp')
require("peek").setup({
                  app = 'chromium'
              })
require('comp')
vim.cmd(":COQnow")
vim.cmd(":COQsnips compile")
