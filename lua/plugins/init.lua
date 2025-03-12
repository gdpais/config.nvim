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
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        keys = {
            { "<leader>a", function() require"harpoon":list():add() end },
            { "<C-e>", function() local harpoon = require "harpoon" harpoon.ui:toggle_quick_menu(harpoon:list()) end },

            { "<C-h>", function() require "harpoon":list():select(1) end },
            { "<C-j>", function() require "harpoon":list():select(2) end },
            { "<C-k>", function() require "harpoon":list():select(3) end },
            { "<C-l>", function() require "harpoon":list():select(4) end },

            -- Toggle previous & next buffers stored within "harpoon" list
            { "<C-[>", function() require "harpoon":list():prev() end },
            { "<C-]>", function() require "harpoon":list():next() end },
        },
    }
    -- TODO: To Play with
    -- {
    --     "folke/persistence.nvim"
    -- },
    -- {
        -- "kylechui/nvim-surround"
        -- version = "*",
        -- event = "VeryLazy"
    -- },
}
