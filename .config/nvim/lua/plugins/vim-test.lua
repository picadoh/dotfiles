return {
    {
        "vim-test/vim-test",
        dependencies = {
            {
                "preservim/vimux",
                main = "vimux",
                enabled = function()
                    return vim.fn.executable("tmux") == 1
                end,
            },
        },
        config = function()
            if (vim.fn.executable("tmux") == 1) then
                vim.cmd("let test#strategy = 'vimux'")
            end

            vim.cmd("let g:VimuxUseNearest = 0")

            vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")
            vim.keymap.set("n", "<leader>T", ":TestFile<CR>")
            vim.keymap.set("n", "<leader>a", ":TestSuite<CR>")
            vim.keymap.set("n", "<leader>l", ":TestLast<CR>")
            vim.keymap.set("n", "<leader>g", ":TestVisit<CR>")
        end
    },
}
