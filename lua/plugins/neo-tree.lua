return {}
--[[return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            --"nvim-lua/plenary.nvim",
            --"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        --lazy = true,
        keys = {
            { "<leader>ef>", vim.cmd.Neotree }
        },
        --TODO: SETUP
        setup = {
        }
    }
}
]]
