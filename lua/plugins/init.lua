return {
    -- Essentials
    {
        "nvim-lua/plenary.nvim",
        event = "VeryLazy"
    },
    {
        "mbbill/undotree",
        lazy = true,
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle }
        },
    },
    -- TODO: To Play with
    -- {
    --     "folke/persistence.nvim"
    -- },
}
