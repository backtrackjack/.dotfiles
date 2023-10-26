return {
    'phpactor/phpactor',
    build = 'composer install --no-dev --optimize-autoloader',
    ft = 'php',
    -- TODO: create autocommand for these maps triggered on php files
    keys = {
        { '<leader>cpm', '<cmd>PhpactorContextMenu<cr>' },
        { '<leader>cpn', '<cmd>PhpactorClassNew<cr>' },
    }
}
