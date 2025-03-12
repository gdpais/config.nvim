local M = {}

M.imap = function(args)
    vim.keymap.set("i", args[1], args[2], args[3] or {} )
end

M.nmap = function(args)
    vim.keymap.set("n", args[1], args[2], args[3] or {} )
end

M.vmap = function(args)
    vim.keymap.set("v", args[1], args[2], args[3])
end

return M
