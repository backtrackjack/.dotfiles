return {
    'phpactor/phpactor',
    build = 'composer install --no-dev --optimize-autoloader',
    ft = 'php',
    keys = {
        { '<leader>pm', ':PhpactorContextMenu<cr>' },
        { '<leader>pn', ':PhpactorClassNew<cr>' },
    }
}
