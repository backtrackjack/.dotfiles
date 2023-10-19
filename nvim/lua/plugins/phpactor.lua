return {
    'phpactor/phpactor',
    build = 'composer install --no-dev --optimize-autoloader',
    ft = 'php',
    keys = {
        { '<leader>pm', '<cmd>PhpactorContextMenu<cr>' },
        { '<leader>pn', '<cmd>PhpactorClassNew<cr>' },
    }
}
