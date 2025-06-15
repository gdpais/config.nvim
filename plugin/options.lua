local opt = vim.opt
-- general
opt.belloff = "all"
opt.scrolloff = 10
opt.clipboard:append "unnamedplus"
opt.mouse = "a"
opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
opt.signcolumn = "yes"
opt.termguicolors = true
opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1
opt.showmatch = false
opt.completeopt = { "menu", "menuone", "noselect" }
opt.shortmess:append "c"
opt.updatetime = 1000
-- numbering
opt.nu = true
opt.relativenumber = true
-- tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true
opt.breakindent = true -- eyes saver
opt.showbreak = string.rep(" ", 3)
opt.linebreak = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
-- search
opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartindent = true
opt.smartcase = true
-- backups
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
-- split preferences
opt.equalalways = false
opt.splitright = true
opt.splitbelow = true
-- fold
opt.foldmethod = "marker"
-- Format (some options will be overruled)
opt.formatoptions = opt.formatoptions
    - "a"
    - "t"
    + "c"
    + "q"
    - "o"
    + "r"
    + "n"
    + "j"

-- Floating window popup menu for completion
-- on command line
opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"
