return {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
        local nls = require("null-ls")
        return {
            root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
            sources = {
                nls.builtins.code_actions.proselint.with({
                    extra_filetypes = { "norg" },
                }),
                nls.builtins.formatting.pint,
                nls.builtins.formatting.prettierd,
                nls.builtins.formatting.rustfmt,
                nls.builtins.formatting.blade_formatter,
                -- this takes some setup
                -- nls.builtins.diagnostics.erb_lint,
                nls.builtins.diagnostics.rubocop,
                nls.builtins.diagnostics.php,
                nls.builtins.diagnostics.alex.with({
                    extra_filetypes = { "norg" },
                }),
                nls.builtins.diagnostics.write_good.with({
                    extra_filetypes = { "norg" },
                }),
                nls.builtins.diagnostics.proselint.with({
                    extra_filetypes = { "norg" },
                }),
            }
        }
    end
}
