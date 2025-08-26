local function lsp_servers()
    local config = {
        lua = "lua_ls",
        gcc = "clangd",
        zig = "zls",
        python = "pylsp",
        go = "gopls",
        cargo = "rust_analyzer",
        node = "ts_ls",
        bash = "bashls",
    }

    local result = {}

    for key, value in pairs(config) do
        if key == nil or vim.fn.executable(key) == 1 then
            table.insert(result, value)
        end
    end

    return result
end

return {
    {
        "nvim-java/nvim-java",
    },

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v4.x",
        lazy = true,
        config = false,
    },

    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },

    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            {
                "nvim-java/nvim-java",
            },
            {
                "saghen/blink.cmp",
            },
            {
                "williamboman/mason.nvim",
            },
            {
                "williamboman/mason-lspconfig.nvim",
            },
        },
        config = function()
            local lsp_zero = require("lsp-zero")

            -- lsp_attach is where you enable features that only work
            -- if there is a language server active in the file
            local lsp_attach = function(_, bufnr)
                local opts = { buffer = bufnr }

                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "x" }, "<leader>f", vim.lsp.buf.format, opts)
                vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
            end

            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                lsp_zero.buffer_autoformat()
            end)

            lsp_zero.extend_lspconfig({
                sign_text = true,
                lsp_attach = lsp_attach,
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            require('java').setup()
            require("lspconfig").jdtls.setup({})

            require("mason-lspconfig").setup({
                ensure_installed = lsp_servers(),
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,

                    lua_ls = function()
                        require("lspconfig").lua_ls.setup({
                            on_init = function(client)
                                lsp_zero.nvim_lua_settings(client, {})
                            end,
                        })
                    end,
                }
            })
        end
    },
}
