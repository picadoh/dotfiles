return {
    {
        "vim-test/vim-test",
        commit = "75b64f23c923d34b56e47846a026210feb57146a",
        dependencies = {
            {
                "preservim/vimux",
                commit = "c4ffa0b992798f3362b27642088dccb251aaef1e",
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
