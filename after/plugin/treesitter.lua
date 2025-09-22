if not pcall(require, "nvim-treesitter") then
    return
end

-- Fancy stuff by @tjdevries, I hope it's okay :)
local swap_next, swap_prev = (function()
    local swap_objects = {
        p = "@parameter.inner",
        f = "@function.outer",
        e = "@element",
    }

    local n, p = {}, {}
    for key, obj in pairs(swap_objects) do
        n[string.format("<M-Space><M-%s>", key)] = obj -- alt+<space> -> swap next
        p[string.format("<M-BS><M-%s>", key)] = obj    -- alt+<backspace> -> swap previous
    end

    return n, p
end)()

-- TODO: RTFM nvim-treesitter & nvim-treesitter-textobjects
require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "c",
        "cpp",
        "go",
        "html",
        "java",
        "javascript",
        "json",
        "markdown",
        "lua",
        "ocaml", --I'll come back for you :)
        "python",
        "query",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc", --after help
        "zig",
    },

    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    --
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<M-w>",     -- maps in normal mode to init the node/scope selection
            node_incremental = "<M-w>",   -- increment to the upper named parent
            node_decremental = "<M-C-w>", -- decrement to the previous node
            scope_incremental = "<M-e>",  -- increment to the upper scope (as defined in locals.scm)
        },
    },

    textobjects = {
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]p"] = "@parameter.inner",
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[p"] = "@parameter.inner",
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@conditional.outer",
                ["ic"] = "@conditional.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["av"] = "@variable.outer",
                ["iv"] = "@variable.inner",
            },
        },
        swap = {
            enable = true,
            swap_next = swap_next,
            swap_previous = swap_prev,
        },
    },

    playground = {
        enable = true,
        updatetime = 25,
        persist_queries = true,
        keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            -- This shows stuff like literal strings, commas, etc.
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
        },
    },
}

require "gabs.keymap".nmap { "<leader>tp", ":TSPlaygroundToggle<CR>" }
