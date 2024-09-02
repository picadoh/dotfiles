return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup {
            view_options = {
                show_hidden = true,
            },
        }

        vim.keymap.set("n", "-", vim.cmd.Oil)
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
    end
}
