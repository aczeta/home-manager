return{
        "folke/which-key.nvim", -- key guide
        "folke/tokyonight.nvim", -- colorscheme
        --------------
        -- COQ NVIM --
        --------------
        {"ms-jpq/coq_nvim", build = "COQdeps"},
        "ms-jpq/coq.artifacts",
        "ms-jpq/coq.thirdparty",
        --------------
        ---  LSP -----
        --------------
        "neovim/nvim-lspconfig",
        "folke/neodev.nvim",   -- for neovim config
        "folke/neoconf.nvim",  -- proper settings for dotfile directory
        {"hinell/lsp-timeout.nvim", dependencies = {"neovim/nvim-lspconfig"}},
}
