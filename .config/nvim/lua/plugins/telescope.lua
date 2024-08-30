return {
    {
        "nvim-telescope/telescope.nvim",
        commit = "a0bbec21143c7bc5f8bb02e0005fa0b982edc026",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                commit = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683",
            },
            {
                -- requires ripgrep
                "nvim-telescope/telescope-live-grep-args.nvim",
                commit = "8ad632f793fd437865f99af5684f78300dac93fb",
            },
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
                }
            })

            telescope.load_extension("live_grep_args")
        end
    },
}
