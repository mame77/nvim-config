return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 
    'nvim-tree/nvim-web-devicons',
    config = function()
        vim.opt.termguicolors = true
        vim.keymap.set("n", "<Tab>", vim.cmd.BufferLineCycleNext)
        vim.keymap.set("n", "<S-Tab>", vim.cmd.BufferLineCyclePrev)
        require("bufferline").setup{}
    end
}


