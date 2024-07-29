return {
    'Wansmer/treesj',
    keys = { '<space>t', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        require('treesj').setup({
            use_default_keymaps = false,
            max_join_length = 1200,
            vim.keymap.set('n', '<leader>t', require('treesj').toggle),
            vim.keymap.set('n', '<leader>T', function()
                require('treesj').toggle({ split = { recursive = true } })
            end)
        })
    end,
}
