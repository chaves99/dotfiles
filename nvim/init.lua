require("config")
require("remap") -- load the keys before lazy
require("config.lazy")
require("plugins.telescope")

vim.cmd('silent! colorscheme melange')
vim.cmd('silent! set clipboard+=unnamedplus')

require 'nvim-treesitter.configs'.setup {
    modules = {},
    ensure_installed = {
        "javascript",
        "lua",
        "vim",
        "markdown",
        "markdown",
        "angular",
        "java",
        "json",
        "typescript",
        "python",
        "html",
        "css",
        "ninja",
        "rst",
    },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        additional_vim_regex_highlighting = false,
    },
}
