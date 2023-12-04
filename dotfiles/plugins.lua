return{
        "folke/which-key.nvim", -- key guide
        "folke/tokyonight.nvim", -- colorscheme
        --------------
        -- Completion --
        --------------
        {"ms-jpq/coq_nvim", build = "COQdeps"},
        "ms-jpq/coq.artifacts",
        "ms-jpq/coq.thirdparty",
        "gelguy/wilder.nvim",
        --------------
        ---  LSP -----
        --------------
        "neovim/nvim-lspconfig",
        "folke/neodev.nvim",   -- for neovim config
        "folke/neoconf.nvim",  -- proper settings for dotfile directory
        {"hinell/lsp-timeout.nvim", dependencies = {"neovim/nvim-lspconfig"}},
        --------------
        -- Markdown --
        --------------
        {
            "toppair/peek.nvim",
            event = { "VeryLazy" },
            build = "deno task --quiet build:fast",
            config = function()
                require("peek").setup()
                -- refer to `configuration to change defaults`
                vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
                vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
            end,
        },
}
