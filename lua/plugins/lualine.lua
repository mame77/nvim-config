-- ステータスライン周り最適化
vim.o.laststatus = 3
vim.o.showmode   = false
vim.o.cmdheight  = 0
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- 顔文字に対応したモード表示関数
        local function mode_to_emoji()
            local mode_map = {
                ['n'] = '<(•‿•)>', -- Normal
                ['i'] = '>(•́o•́)>', -- Insert
                ['V'] = '>(•̀▽•̀)<', -- Visual Line
                ['R'] = '<(｡•́︿•̀｡)>', -- Replace
                ['c'] = '<(ಠ_ಠ)>', -- Command-line
                ['s'] = '<(⌐■_■)>', -- Select
                ['t'] = '<(ง •̀_•́)ง>', -- Terminal
            }
            local mode = vim.api.nvim_get_mode().mode
            return mode_map[mode] or '🤖'
        end


        local colors = {

            blue   = '#80a0ff',

            cyan   = '#79dac8',

            black  = '#080808',

            white  = '#c6c6c6',

            red    = '#f38ba8', -- Catppuccinの赤

            violet = '#d183e8',

            grey   = '#303030',

        }


        -- カスタムテーマ

        local bubbles_theme = {

            normal = {

                a = { fg = colors.black, bg = colors.blue },

                b = { fg = colors.white, bg = colors.grey },

                c = { fg = colors.white },

            },

            insert = { a = { fg = colors.black, bg = colors.red } }, -- ここを赤に！

            visual = { a = { fg = colors.black, bg = colors.cyan } },

            replace = { a = { fg = colors.black, bg = colors.red } },


            inactive = {

                a = { fg = colors.white, bg = colors.black },

                b = { fg = colors.white, bg = colors.black },

                c = { fg = colors.white },

            },

        }



        -- lualine 設定本体

        require('lualine').setup {

            options = {

                theme = bubbles_theme,

                component_separators = '',

                section_separators = { left = '', right = '' },

            },

            sections = {

                lualine_a = {

                    { mode_to_emoji, separator = { left = '' }, right_padding = 2 },

                },

                lualine_b = { 'filename', 'branch' },

                lualine_c = { '%=' }, -- 中央寄せ用

                lualine_x = {},

                lualine_y = { 'filetype', 'progress' },

                lualine_z = {

                    { 'location', separator = { right = '' }, left_padding = 2 },

                },

            },

            inactive_sections = {

                lualine_a = { 'filename' },

                lualine_b = {},

                lualine_c = {},

                lualine_x = {},

                lualine_y = {},

                lualine_z = { 'location' },

            },

            tabline = {},

            extensions = {},

        }
    end,

}
