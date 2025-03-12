local keymap = require "gabs.keymap"
local nmap = keymap.nmap
local imap = keymap.imap
local vmap = keymap.vmap

-- Copy entire buffer.
nmap { "<leader>y", "<cmd>%yank<cr>", { desc = "yank entire buffer" } }
vim.keymap.set("x", "<leader>pp", "\"_dP", { desc = "paste saving last register" })

-- Rerun last command
nmap { "<leader><leader>k", ":<Up><CR>", { desc = "rerun last command", silent = false } }

-- Move lines
vmap { "K", ":m '<-2<CR>gv=gv", { desc = "move line up" } }
vmap { "J", ":m '>+1<CR>gv=gv", { desc = "move line down" } }
nmap { "J", "mzJ`z", { desc = "append the next line onto the current one" } }
-- Search
--nmap { "<C-k>", "<cmd>cnext<CR>zz", {desc ="get next + center screen"} }
--nmap { "<C-j>", "<cmd>cprev<CR>zz", {desc ="get previous + center screen"} }
nmap { "<leader>k", "<cmd>lnext<CR>zz", { desc = "get next + center screen" } }
nmap { "<leader>j", "<cmd>lprev<CR>zz", { desc = "get previous + center screen" } }

-- Replace
nmap { "<leader>sw", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", {
    desc = "replace word under the cursor (all file)" } }

-- Scroll & Centering
nmap { "<C-u>", "<C-u>zz", { desc = "half page up + center screen" } }
nmap { "<C-d>", "<C-d>zz", { desc = "half page down + center screen" } }
nmap { "n", "nzzzv", { desc = "search next + center screen" } }
nmap { "N", "Nzzzv", { desc = "search prev + center screen" } }

-- Netrw (:Explore)
nmap { "<leader>ef", "<cmd>Explore<CR>", { desc = "Open Netrw in full size" } }
nmap { "<leader>ee", "<cmd>Lexplore<CR>", { desc = "Open Netrw in the working dir" } }
nmap { "<leader>ec", "<cmd>Lexplore %:p:h<CR>", { desc = "Open Netrw in the dir of the current file" } }

-- Window Split
nmap { "<leader>W", "<cmd>vsplit<CR>", { desc = "split vertical" } }
nmap { "<M-k>", "<C-W><C-H>", { desc = "move left window" } }
nmap { "<M-j>", "<C-W><C-l>", { desc = "move right" } }
nmap { "<M-h>", "<C-W>5<", { desc = "resize window horizontally <" } }
nmap { "<M-l>", "<C-W>5>", { desc = "resize window horizontally >" } }
nmap { "<M-K>", "<C-W>-", { desc = "resize window vertically -" } }
nmap { "<M-J>", "<C-W>+", { desc = "resize window vertically +" } }

-- Tabs
nmap { "<leader>cn", "<cmd>tabc<CR>", { desc = "Tab close" } }
nmap { "<leader>tn", "<cmd>tabe<CR>", { desc = "New tab" } }

-- Terminal
vim.keymap.set('t', "<leader><ESC>", "<C-\\><C-n>")
vim.keymap.set('t', "<M-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set('t', "<M-l>", "<C-\\><C-n><C-w>l")

-- Make executable file
nmap { "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true } }

-- MarkdownPreview
nmap { "<leader>m", ":MarkdownPreviewToggle<CR>", { desc = "Toggles markdown preview" } }

-- Spell check
nmap { "<F11>", "<cmd>set spell!<cr>", { desc = "toggle spell" } }
imap { "<F11>", "<c-o><cmd>set spell!<cr>", { desc = "toggle spell" } }

--Exit insert mode
imap { "<C-c>", "<ESC>", { desc = "exit insert mode" } }
