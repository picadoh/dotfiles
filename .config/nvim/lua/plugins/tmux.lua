return {
    "christoomey/vim-tmux-navigator",
    commit = "5b3c701686fb4e6629c100ed32e827edf8dad01e",
    enabled = function()
        return vim.fn.executable("tmux") == 1
    end,
    config = function()
        vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>")
        vim.keymap.set("n", "C-j", ":TmuxNavigateDown<CR>")
        vim.keymap.set("n", "C-k", ":TmuxNavigateUp<CR>")
        vim.keymap.set("n", "C-l", ":TmuxNavigateRight<CR>")
    end
}
