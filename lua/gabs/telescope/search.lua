local M = {}

local themes = require "telescope.themes"
local actions = require "telescope.actions"

M.find_anything = function()
    require("telescope.builtin").find_files {
        hidden = true,
    }
end

M.search_dotfiles = function()
    require("telescope.builtin").find_files {
        prompt_title = "< dotfiles >",
        cwd = "~/.config/",
        hidden = true,
    }
end

M.search_nvim = function()
    require("telescope.builtin").find_files {
        prompt_title = "< Neovim Cfg >",
        cwd = "~/.config/nvim",
        hidden = true,
    }
end


M.live_grep = function()
    require("telescope.builtin").live_grep {
        previewer = false,
    }
end

M.grep_str = function()
    require("telescope.builtin").grep_string {
        --previewer = false,
        shorten_path = true,
        search = vim.fn.input "Grep String > "
    }
end

M.oldfiles = function()
    require("telescope.builtin").oldfiles {
        previewer = false,
    }
end

M.currbuf = function()
    local opts = themes.get_dropdown {
        winblend = 10,
        previewer = false,
        shorten_path = false,
    }

    require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

-- Git
M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map("i", "<C-d>", actions.git_delete_branch)
            map("n", "<C-d>", actions.git_delete_branch)
            return true
        end,
    })
end

M.git_files = function()
    local opts = themes.get_dropdown {
        cwd = vim.fn.expand "%:h",
        --cwd = vim.fn.expand "%:p:h",
        shorten_path = false,
        previewer = false,
        winblend = 10,

        layout_config = {
            width = 0.5,
        },
    }

    require("telescope.builtin").git_files(opts)
end

M.git_status = function()
    require("telescope.builtin").git_status {
        shorten_path = false,
    }
end

M.git_commits = function()
    require("telescope.builtin").git_commits {
        winblend = 5,
    }
end

-- Browser
M.bookmarks = function()
    require("telescope").extensions.bookmarks.bookmarks {
        previewer = false
    }
end

-- Not used ATM
--M.lsp_references = function()
--    require("telescope.builtin").lsp_references {
--        layout_strategy = "vertical",
--        layout_config = {
--            prompt_position = "top",
--        },
--        sorting_strategy = "ascending",
--        ignore_filename = false,
--    }
--end
--
--M.lsp_implementations = function()
--    require("telescope.builtin").lsp_implementations {
--        layout_strategy = "vertical",
--        layout_config = {
--            prompt_position = "top",
--        },
--        sorting_strategy = "ascending",
--        ignore_filename = false,
--    }
--end

return M
