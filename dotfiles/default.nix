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
    home.file."./.config/nvim/plugins.lua".source = ./plugins.lua; 
    home.file."./.config/nvim/lua/plugins/wk.lua".source = ./wk.lua;
    home.file."./.config/nvim/lua/plugins/tokyo.lua".source = ./tokyo.lua;
    home.file."./.config/nvim/lua/plugins/peek.lua".source = ./peek.lua;
    home.file."./.config/nvim/lua/plugins/lsp.lua".source = ./lsp.lua;
    home.file."./.config/nvim/lspconfig.lua".source = ./lspconfig.lua;
}
