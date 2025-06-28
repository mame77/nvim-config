vim.g.leader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- コピー: Visualモード
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })


-- ペースト: Normalモード / Visualモード
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" }) -- クリップボードから貼り付け
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste from clipboard (visual)" })

