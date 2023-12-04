vim.cmd(" let g:coq_settings = { 'keymap.eval_snips': '<leader>j' } ")
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
