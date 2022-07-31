vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer for managing packages
    use 'wbthomason/packer.nvim'
    -- Treesitter for syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    -- LSP support
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    }
    -- Autocompletion
    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
    }
    -- Color scheme
    use 'folke/tokyonight.nvim'
end)
