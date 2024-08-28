return {
    {
        "nvim-telescope/telescope.nvim",
        commit = "a0bbec21143c7bc5f8bb02e0005fa0b982edc026",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                commit = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683",
            },
        },
        config = function()
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
        end
    },
}
