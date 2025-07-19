return {
    {
        "stevearc/aerial.nvim",
        opts = {
            -- optionally use on_attach to set keymaps when aerial has attached to a buffer
            on_attach = function(bufnr)
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
        },
        lazy = true,
        keys = {
            { "<leader>lf", "<cmd>AerialToggle!<CR>" }
        },
    }
}
