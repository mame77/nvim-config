-- plugin/catppuccin.lua

return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "macchiato",
            transparent_background = true,
            integrations = {
                -- 任意のLSPやプラグインと連携するならここに書く
            },
        })

        -- カラースキームを適用
        vim.cmd.colorscheme("catppuccin")

        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ed8796", bold = true })
    end,
}
