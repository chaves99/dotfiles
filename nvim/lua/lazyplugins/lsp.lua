return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        --local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- local capabilities = require('blink.cmp').get_lsp_capabilities()

        require('mason').setup {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }

        local mason_lspconfig = require 'mason-lspconfig'

        mason_lspconfig.setup {
            ensure_installed = {
                "lua_ls",
                "ruby_lsp",
                "angularls",
                "pylsp",
                "ts_ls",
                "html",
                "cssls",
                "sqlls",
                "wc_ls",
            }
        }

        local lspconfig = require("lspconfig")

        -- lspconfig.pyright.setup {
        -- }

        -- lspconfig.lua_ls.setup {
        --     capabilities = capabilities,
        -- }
        --
        -- lspconfig.angularls.setup {
        --     capabilities = capabilities,
        -- }
        --
        -- lspconfig.ts_ls.setup {
        --     capabilities = capabilities,
        -- }
        --
        -- lspconfig.html.setup {
        --     capabilities = capabilities,
        -- }
        --
        -- lspconfig.cssls.setup {
        --     capabilities = capabilities,
        -- }
        --

        vim.lsp.config('pylsp', {
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = { 'W391' },
                            maxLineLength = 100
                        },
                        rope_autoinport = {
                            enabled = true,
                        }
                    }
                }
            }
        })

        local function ts_ls_organize_imports(bufnr)
            -- gets the current bufnr if no bufnr is passed
            if not bufnr then bufnr = vim.api.nvim_get_current_buf() end

            -- params for the request
            local params = {
                command = "_typescript.organizeImports",
                arguments = { vim.api.nvim_buf_get_name(bufnr) },
                title = ""
            }

            vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", params, 500)
        end

        vim.lsp.config('ts_ls', {
            on_attach = function()
                vim.keymap.set("n", "<leader>oi", ts_ls_organize_imports)
                vim.opt.tabstop = 2
                vim.opt.softtabstop = 2
                vim.opt.shiftwidth = 2
            end
        })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "none",
                header = "",
                prefix = "",
            },
        })
    end
}
