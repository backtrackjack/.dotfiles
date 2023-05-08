return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "prettierd",
            "pint",
            "stylua",
            "flake8",
            "shfmt",
            "rust-analyzer",
            "rustfmt",
            "blade-formatter",
        },
        automatic_installation = false,
    }
}
