-- Turn on relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 space indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Do you best vim
vim.opt.smartindent = true

-- Text wrapping is gross
vim.opt.wrap = false

-- Don't need a back cus I got undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Better searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Better colors
vim.opt.termguicolors = true

-- Better scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Fast update time
vim.opt.updatetime = 50

-- Long lines pay fines
vim.opt.colorcolumn = "80"

-- Leader key
vim.g.mapleader = " "
