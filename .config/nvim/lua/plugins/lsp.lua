return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v4.x",
        commit = "0161aeab61d407aa1d43326a5dfc33479f4c53f6",
        lazy = true,
        config = false,
    },

    {
        "williamboman/mason.nvim",
        commit = "e2f7f9044ec30067bc11800a9e266664b88cda22",
        lazy = false,
        config = true,
    },

    {
        "hrsh7th/nvim-cmp",
        commit = "ae644feb7b67bf1ce4260c231d1d4300b19c6f30",
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            local cmp_action = require("lsp-zero").cmp_action()

            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                },
                preselect = "item",
                completion = {
                    completeopt = "menu,menuone,noinsert"
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-f>"] = cmp_action.vim_snippet_jump_forward(),
                    ["<C-b>"] = cmp_action.vim_snippet_jump_backward(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<Tab>"] = cmp_action.tab_complete(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
                }),
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
            })

            cmp.setup.filetype({ "sql" }, {
                sources = {
                    { name = "vim-dadbod-completion" },
                    { name = "buffer" },
                },
            })
        end
    },

    {
        "neovim/nvim-lspconfig",
        commit = "a89de2e049b5f89a0ee55029d5a31213bd4de6f8",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp",
                commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d",
            },
            {
                "williamboman/mason.nvim",
                commit = "e2f7f9044ec30067bc11800a9e266664b88cda22",
            },
            {
                "williamboman/mason-lspconfig.nvim",
                commit = "1c55991321d1a861537e32446affc5de5d9a6eaf",
            },
        },
        config = function()
            local lsp_zero = require("lsp-zero")

            -- lsp_attach is where you enable features that only work
            -- if there is a language server active in the file
            local lsp_attach = function(_, bufnr)
                local opts = { buffer = bufnr }

                vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
                vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
                vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
                vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
                vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
                vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
                vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
                vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
                vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
                vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
            end

            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                lsp_zero.buffer_autoformat()
            end)

            lsp_zero.extend_lspconfig({
                sign_text = true,
                lsp_attach = lsp_attach,
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "zls",
                    "pylsp",
                    "gopls",
                    "tsserver",
                    "bashls",
                },
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
