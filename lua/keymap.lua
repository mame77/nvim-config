vim.g.leader = " "

vim.opt.timeoutlen = 300

vim.keymap.set({ "n", "v", "x", "s" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v", "x", "s" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })

vim.keymap.set("n", "<leader>t", ":tabnew | Ex<CR>", { desc = "New Tab with Explorer" })

vim.keymap.set("n", "<leader>j", vim.cmd.Ex, { desc = "ファイルツリー（Ex）" })
vim.keymap.set("n", "<leader>k", vim.cmd.w, { desc = "保存" })
vim.keymap.set("n", "<leader>n", vim.cmd.q, { desc = "終了" })
