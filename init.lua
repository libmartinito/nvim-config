vim.opt.guicursor = "n-i-v:block"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Configuration for treesitter
require'nvim-treesitter.configs'.setup {
    -- A list of parser names
    ensure_installed = { "c", "lua", "css", "html", "json", "typescript", "vue", "prisma" },

    -- Install parsers synchronously
    sync_install = false,

    -- Automatically install missing parsers
    auto_install = true,

    highlight = {
        enable = true,
    },
}

-- Configuration for LSP
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "sumneko_lua", "cssls", "html", "jsonls", "tsserver", "volar", "prismals" }
})

-- Configuration for autocompletion
local cmp = require'cmp'

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')["sumneko_lua"].setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'use' }
            }
        }
    }
}

require('lspconfig')["cssls"].setup {
    capabilities = capabilities
}

require('lspconfig')["html"].setup {
    capabilities = capabilities
}

require('lspconfig')["jsonls"].setup {
    capabilities = capabilities
}

require('lspconfig')["tsserver"].setup {
    capabilities = capabilities
}

require('lspconfig')["volar"].setup {
    capabilities = capabilities
}

require('lspconfig')["prismals"].setup {
    capabilities = capabilities
}

-- Configuration for the color shceme
vim.g.tokyonight_style = 'night'
vim.cmd[[colorscheme tokyonight]]
