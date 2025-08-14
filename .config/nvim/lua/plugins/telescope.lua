return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
            },
            {
                -- requires ripgrep
                "nvim-telescope/telescope-live-grep-args.nvim",
            },
            {
                "nvim-telescope/telescope-ui-select.nvim",
            }
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
            vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

            telescope.setup({
                pickers = {
                    find_files = {
                        hidden = true,
                    }
                },
                defaults = {
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                        '--hidden',
                    },
                    path_display = { "smart" }
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            })

            telescope.load_extension("live_grep_args")
            telescope.load_extension("ui-select")
        end
    }
}
