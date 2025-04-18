return {
    {
        "tjdevries/express_line.nvim",
        opts = {
            generator = function()
                vim.opt.laststatus = 3

                local builtin = require "el.builtin"
                local extensions = require "el.extensions"
                local subscribe = require "el.subscribe"
                local sections = require "el.sections"
                local segments = {}

                table.insert(segments, extensions.mode)
                table.insert(segments, " ")
                table.insert(
                segments,
                subscribe.buf_autocmd("el-git-branch", "BufEnter", function(win, buf)
                    local branch = extensions.git_branch(win, buf)
                    if branch then
                        return branch
                    end
                end)
                )
                table.insert(
                segments,
                subscribe.buf_autocmd("el-git-changes", "BufWritePost", function(win, buf)
                    local changes = extensions.git_changes(win, buf)
                    if changes then
                        return changes
                    end
                end)
                )

                table.insert(segments, sections.split)
                table.insert(segments, "%f")
                table.insert(segments, builtin.modified)
                table.insert(segments, sections.split)
                table.insert(segments, builtin.filetype)
                table.insert(segments, "[")
                table.insert(segments, builtin.line_with_width(3))
                table.insert(segments, ":")
                table.insert(segments, builtin.column_with_width(2))
                table.insert(segments, "]")

                return segments
            end,
        },
    },
--[[ {
    "nvim-lualine/lualine.nvim",
    priority = 1000,
    opts = {
        options = {
            icons_enabled = true,
            theme = 'tokyonight',
            --theme = "iceberg_dark",
            --component_separators = { left = '', right = '' },
            --section_separators = { left = '', right = '' },
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        -- +-------------------------------------------------+
        -- | A | B | C                             X | Y | Z |
        -- +-------------------------------------------------+
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { {
                'filename',
                path = 3, -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory
                -- 4: Filename and parent dir, with tilde as the home directory
            } },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    },
}, ]]
}
