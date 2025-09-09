vim.opt.relativenumber = true



vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.number = true
vim.cmd("colorscheme catppuccin")
vim.cmd.colorscheme("catppuccin")

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })
