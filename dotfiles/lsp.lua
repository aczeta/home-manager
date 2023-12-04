require("neodev").setup({})
require("neoconf").setup({})

local lspconfig = require('lspconfig')

-- Enable some language servers with coq attachment

lspconfig.rust_analyzer.setup(require('coq').lsp_ensure_capabilities({}))
lspconfig.lua_ls.setup(require('coq').lsp_ensure_capabilities({}))
lspconfig.nixd.setup(require('coq').lsp_ensure_capabilities({}))
