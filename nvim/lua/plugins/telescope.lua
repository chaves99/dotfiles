local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' }) -- it needs https://github.com/BurntSushi/ripgrep to work
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>rr", function()
    builtin.lsp_references({
        include_declaration = false,
        show_line = false
    })
end, { desc = "LSP References" })

require('telescope').setup {
    defaults = {
        layout_strategy = 'vertical',
        layout_config = {
            height = 0.99
        },
    },
}
