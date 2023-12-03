-- Initially made by mattermost

-- [[ opts.lua ]]
local opt = vim.opt

-- [[ Context ]]
opt. colorcolumn = '80'                    -- str: Show col for max line length
opt.relativenumber = true                  -- bool: Show relative line numbers
opt.scrolloff = 4                          -- int: Min num lines of context
opt.signcolumn = "yes"                     -- str: Show the sign column
opt.cursorline = true                      -- bool: Highlight current line
opt.number = true                          -- bool: Show line numbers
-- [[ Filetypes ]]
opt.encoding = 'utf8'                      -- str: String encoding to use
opt.fileencoding = 'utf8'                  -- str: File encoding to use

-- [[ Theme ]]
opt.syntax = "ON"                          -- str: Allow syntax highlighting
opt.termguicolors = true                   -- bool: Use TrueColor

-- [[ Search ]]
opt.ignorecase = true                      -- bool: Ignore case in search
opt.smartcase = true                       -- bool: Override ignore case if
                                           -- first letter is uppercase
opt.incsearch = true                       -- bool: Use incremental search
opt.hlsearch = true                        -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true                       -- bool: Use spaces instead of tabs
opt.shiftwidth = 4                         -- num: Size of an indent
opt.softtabstop = 4                        -- num: Number of spaces tabs count
opt.tabstop = 4                            -- num: Number of spaces tabs count

-- [[ Splits ]]
opt.splitright = true                      -- bool: Vertical split setting
opt.splitbelow = true                      -- bool: Horizontal split setting
