-- disable accidental Help
vim.keymap.set({ "n", "i", "v" }, "<F1>", "<nop>", { noremap = true, silent = true })

-- disable accidental Ex
vim.keymap.set("n", "Q", "<nop>", { noremap = true, silent = true })

-- hex editor
vim.keymap.set("n", "<F7>", ":%!xxd<CR>")
vim.keymap.set("n", "<F8>", ":%!xxd -r<CR>")

-- move by actual line and not wrapped line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- keep cursor left
vim.keymap.set("n", "J", "mzJ`z")

-- move selected lines up or down, keep cursor left
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- delete or paste without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
vim.keymap.set("x", "<leader>p", "\"_dP")

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- select all/block
vim.keymap.set("n", "<leader>sa", "ggVG")
vim.keymap.set("n", "<leader>sb", "v%")

-- save
vim.keymap.set("n", "<leader>s", ":w !sudo tee %<CR>")

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- central pagination
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
