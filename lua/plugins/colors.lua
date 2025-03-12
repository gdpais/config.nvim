return {
    {
        "norcalli/nvim-colorizer.lua",
        opts = {
            "css",
        },
        config = function()
            require"colorizer".setup()
        end
    },
}
