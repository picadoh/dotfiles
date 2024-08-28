return {
    {
        "nvim-lualine/lualine.nvim",
        commit = "b431d228b7bbcdaea818bdc3e25b8cdbe861f056",
        options = {
            icons_enabled = true,
        },
        config = function()
            require("lualine").setup()
        end
    },
}
