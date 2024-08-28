return {
    {
        "catppuccin/nvim",
        commit = "18bab5ec4c782cdf7d7525dbe89c60bfa02fc195",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin]])
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    }
}
