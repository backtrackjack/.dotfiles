return {
    'tpope/vim-projectionist',
    dependencies = { 'tpope/vim-dispatch' },
    config = function()
        vim.g.projectionist_heuristics = {
            artisan = {
                ['*'] = {
                    start = 'php artisan serve',
                    console = 'php artisan tinker'
                },
                ['app/*.php'] = {
                    type = 'source',
                    alternate = {
                        'tests/Unit/{}Test.php',
                        'tests/Feature/{}Test.php'
                    }
                },
                ['tests/Feature/*Test.php'] = {
                    type = 'test',
                    alternate = 'app/{}.php'
                },
                ['tests/Unit/*Test.php'] = {
                    type = 'test',
                    alternate = 'app/{}.php'
                },
                ['app/Http/Livewire/*.php'] = {
                    type = 'livewire',
                    alternate = {
                        'resources/views/livewire/{snakecase|hyphenate}.blade.php',
                    }
                },
                ['app/Livewire/*.php'] = { -- livewire 3 default folder
                    type = 'livewire',
                    alternate = {
                        'resources/views/livewire/{snakecase|hyphenate}.blade.php',
                    }
                },
                ['resources/views/livewire/*.blade.php'] = {
                    type = 'livewire-view',
                    alternate = {
                        'app/Http/Livewire/{capitalize|camelcase}.php',
                    }
                },
                ['app/View/Components/*.php'] = {
                    type = 'component',
                    alternate = {
                        'resources/views/components/{snakecase|hyphenate}.blade.php',
                    }
                },
                ['resources/views/components/*.blade.php'] = {
                    type = 'component-view',
                    alternate = {
                        'app/View/Components/{capitalize|camelcase}.php'
                    }
                },
                ['app/Models/*.php'] = {
                    type = 'model',
                },
                ['resources/views/*.php'] = {
                    type = 'view',
                },
                ['app/Http/Controllers/*.php'] = {
                    type = 'controller'
                },
                ['routes/*.php'] = {
                    type = 'route',
                },
                ['database/migrations/*.php'] = {
                    type = 'migration',
                }
            }
        }
    end
}
