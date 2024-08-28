return {
    "stevearc/oil.nvim",
    commit = "a632c898fbe0e363ef89b9577f1a7714ab67d682",
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
