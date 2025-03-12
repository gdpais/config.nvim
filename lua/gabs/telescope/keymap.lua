local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

local tel_search = require "gabs.telescope.search"
local tel_builtin = require "telescope.builtin"
--local nmap = require("gabs.keymap").nmap

local M = {
    -- nmap { "", tel_builtin.keymaps },
    --nmap { "", tel_builtin.builtin },
    { "<leader>sh", tel_builtin.help_tags },
    { "<leader>pd", tel_builtin.diagnostics },

    --nmap { "<leader>buffer", tel_builtin.buffers }
    { "<leader>?", tel_search.oldfiles, { desc = "[?] Find recently opened files" } },
    { "<leader>/", tel_search.currbuf },
    { "<leader>lg", tel_search.live_grep },
    { "<leader>ps", tel_search.grep_str },
    { "<leader>pf", tel_search.find_anything },

    -- dotfiles + projects
    { "<leader>vrc", tel_search.search_nvim },
    --nmap { "<leader>vb", tel_search.nvim_source },
    --nmap { "<leader>dt", tel_search.search_dotfiles },
    --nmap { "<leader>nb", tel_search.search_notebook },
    --nmap { "<leader>pw", tel_search.search_work },

    -- Git
    { "<leader>gb", tel_search.git_branches },
    { "<leader>gf", tel_search.git_files },
    { "<leader>gs", tel_search.git_status },
    { "<leader>gc", tel_search.git_commits },
    { "<leader>gw", function() telescope.extensions.git_worktree.git_worktrees() end },

}
-- Browser bookmarks
--nmap { "<leader>pb", tel_search.bookmarks },

return M
