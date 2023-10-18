return {
    'echasnovski/mini.animate',
    init = function()
        animate = require('mini.animate')
        animate.setup({
        scroll = {
            enable = false,
        },
        cursor = {
            timing = animate.gen_timing.cubic({ duration = 50, unit = 'total' })
        }
    })
    end
}
