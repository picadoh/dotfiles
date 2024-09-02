return {
    "christoomey/vim-tmux-navigator",
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
