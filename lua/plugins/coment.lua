return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
        local comment = require("Comment")

        comment.setup({
            toggler = { line = nil, block = nil },
            opleader = { line = nil, block = nil },
            mappings = { basic = false, extra = false, extended = false },
        })

        -- Visualモード用キーマップ（<leader>/ を使ってコメントトグル）
        vim.keymap.set("t", "<leader>/", function()
            require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end, { desc = "Toggle comment (visual)", noremap = true })
    end,
}
