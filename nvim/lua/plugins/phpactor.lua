return {
    'phpactor/phpactor',
    ft = 'php',
    build = 'composer install --no-dev --optimize-autoloader',
    config = function()
        vim.keymap.set('n', '<leader>pm', ':PhpactorMoveFile<cr>')
    end
}
