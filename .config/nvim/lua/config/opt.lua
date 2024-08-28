-- cursor
vim.opt.guicursor = ""

-- typing (ftplugin and .editorconfig will take precedence)
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.colorcolumn = "120"

-- recover
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vimstash/undo"

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.scrolloff = 5

-- appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes:1"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.shortmess:append("I")

-- responsiveness
vim.opt.updatetime = 50

