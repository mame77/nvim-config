return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        vim.opt.termguicolors = true
        -- バッファライン設定
        require("bufferline").setup({
            options = {
                mode = "buffers", -- "tabs"から"buffers"に変更してバッファごとにタブ表示
                separator_style = "rounded",
                numbers = "ordinal",
                diagnostics = "nvim_lsp",
                always_show_bufferline = true,
                color_icons = true,
                show_close_icon = false,
                show_buffer_close_icons = false,
                -- 特殊バッファを除外
                custom_filter = function(buf_number)
                    local filetype = vim.bo[buf_number].filetype
                    local buftype = vim.bo[buf_number].buftype
                    -- netrw、help、terminal、quickfixなどを除外
                    if filetype == "netrw" or
                        filetype == "help" or
                        buftype == "terminal" or
                        buftype == "quickfix" or
                        buftype == "nofile" then
                        return false
                    end
                    return true
                end,
                offsets = {
                    {
                        filetype = "coc-explorer",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
            highlights = require("catppuccin.groups.integrations.bufferline").get(),
        })

        -- タブ移動キーマップ（Vim風）
        vim.keymap.set("n", "<Leader>h", vim.cmd.BufferLineCyclePrev, { desc = "前のバッファ" })
        vim.keymap.set("n", "<Leader>l", vim.cmd.BufferLineCycleNext, { desc = "次のバッファ" })
        -- 追加のキーマップ：バッファ管理
        vim.keymap.set("n", "<Leader>m", vim.cmd.bdelete, { desc = "バッファを閉じる" })
        -- バッファ番号で直接移動
        for i = 1, 9 do
            vim.keymap.set("n", "<Leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
                { desc = "バッファ" .. i .. "に移動" })
        end
        -- netrwなどの特殊バッファを除外する設定
        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*",
            callback = function()
                local bufnr = vim.api.nvim_get_current_buf()
                local bufname = vim.api.nvim_buf_get_name(bufnr)
                local filetype = vim.bo[bufnr].filetype
                -- netrwバッファを自動削除
                if filetype == "netrw" then
                    vim.schedule(function()
                        if vim.api.nvim_buf_is_valid(bufnr) then
                            vim.api.nvim_buf_set_option(bufnr, "buflisted", false)
                        end
                    end)
                end
            end
        })
        -- netrwを閉じたときにバッファを削除
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "netrw",
            callback = function()
                local bufnr = vim.api.nvim_get_current_buf()
                vim.api.nvim_buf_set_option(bufnr, "buflisted", false)
                -- qキーでnetrwを閉じてバッファも削除
                vim.keymap.set("n", "q", function()
                    vim.cmd("bdelete")
                end, { buffer = bufnr, desc = "netrwを閉じる" })
            end
        })
    end,
}
