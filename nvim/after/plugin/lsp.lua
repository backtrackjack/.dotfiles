local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'intelephense',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('intelephense', {
    filetypes = { "php" },
    ignore_filetypes = { "blade" }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.config.disable,
    ['<S-Tab>'] = cmp.config.disable,
    ['<CR>'] = cmp.config.disable,
})

lsp.setup_nvim_cmp({
    preselect = cmp.PreselectMode.None,
    mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = false,
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
