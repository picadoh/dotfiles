return {
    {
        "mbbill/undotree",
        commit = "56c684a805fe948936cda0d1b19505b84ad7e065",
        config = function ()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
}