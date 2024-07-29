return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",        --C
                    "cssls",         --css
                    "cssmodules_ls", --css module
                    "unocss",
                    "html",
                    "htmx",
                    --	"biome", --JSON/TS/JS
                },
                opts = {
                    auto_install = true,
                },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilitiesClangd = vim.lsp.protocol.make_client_capabilities()
            capabilitiesClangd.offsetEncoding = { "utf-16" }
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({
                capabilities = capabilitiesClangd,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.unocss.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.htmx.setup({
                capabilities = capabilities,
            })
            lspconfig.biome.setup({
                capabilities = capabilities,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                    -- Buffer local mappings.
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.lsp.buf.format({ async = true })
                end,
            })
            -- End of the config function
        end,
    },
}
