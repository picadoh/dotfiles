-- execute current query
vim.keymap.set("n", "<localleader>r", ":normal vip<CR><PLUG>(DBUI_ExecuteQuery)", { buffer = true })
