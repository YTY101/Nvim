return {
    "phaazon/hop.nvim",
    config = function()
        require("hop").setup({})
        vim.api.nvim_set_keymap("n", "<leader>hc", "<cmd>HopChar2<cr>", { silent = true })
        vim.api.nvim_set_keymap("n", "<leader>hcc", "<cmd>HopChar2MW<cr>", { silent = true })
        vim.api.nvim_set_keymap("n", "<leader>hw", "<cmd>HopWord<cr>", { silent = true })
        vim.api.nvim_set_keymap("n", "<leader>hww", "<cmd>HopWordMW<cr>", { silent = true })
        vim.api.nvim_set_keymap("n", "<leader>hl", "<cmd>HopLine<cr>", { silent = true })
        vim.api.nvim_set_keymap("n", "<leader>hls", "<cmd>HopLineStart<cr>", { silent = true })
    end,
}
