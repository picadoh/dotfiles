vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider = 0

vim.o.autoread = true
vim.o.autowrite = true
vim.o.mouse = ''

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end
})
