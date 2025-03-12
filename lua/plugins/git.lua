local config = require "gabs.git.config"

return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = config.gitsigns.opts
    },
    {
        "rhysd/git-messenger.vim",
        lazy = true,
        keys = config.messenger.keys,
    },
    {
        "sindrets/diffview.nvim",
        lazy = true,
        keys = config.diffview.keys,
    },

    {
        "tpope/vim-fugitive" ,
        lazy = true,
        keys = config.fugitive.keys,
    },
    {
        "ThePrimeagen/git-worktree.nvim",
        lazy = true,
    },
}
