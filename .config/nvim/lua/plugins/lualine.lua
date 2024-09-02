return {
    {
        "nvim-lualine/lualine.nvim",
        options = {
            icons_enabled = true,
        },
        config = function()
            require("lualine").setup()
        end
    },
}
