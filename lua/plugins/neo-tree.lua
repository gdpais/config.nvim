return {
    --BUG: Not working as it should
    --[[ {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        lazy = false,
        opts = {},
        keys = {
            { "<leader>ef>", vim.cmd.Neotree }
        },
    } ]]
}
