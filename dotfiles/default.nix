# Install and configure programs with complex configuration not covered by 
# home manager modules.
{pkgs, ...} : 
{
    # Install neovim and set some basic config
    programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        defaultEditor = true;
    };
    # Setup neovim config
    home.file."./.config/nvim/init.lua".source = ./init.lua;
    home.file."./.config/nvim/lua/plugins/plugins.lua".source = ./plugins.lua;
    home.file."./.config/nvim/lua/colorscheme.lua".source = ./colorscheme.lua;
    home.file."./.config/nvim/lua/opts.lua".source = ./opts.lua; 
    home.file."./.config/nvim/lua/keys.lua".source = ./keys.lua;
    home.file."./.config/nvim/lua/lspconfig.lua".source = ./lspconfig.lua; 
}
