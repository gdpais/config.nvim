local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local dark_magic = augroup("dark-magic", {})
local _augroups = {}
local get_augroup = function(client)
    if not _augroups[client.id] then
        local group_name = 'dark-magic-' .. client.name
        local id = augroup(group_name, { clear = true })
        _augroups[client.id] = id
    end

    return _augroups[client.id]
end

-- Kickstart autoformat
-- Whenever an LSP attaches to a buffer, we will run this function.
-- See `:help LspAttach`
autocmd("LspAttach", {
    group = augroup("lsp-attach-format", { clear = true }),

    -- This is where we attach the autoformatting for reasonable clients
    callback = function(args)
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        local bufnr = args.buf

        -- Only attach to clients that support document formatting
        if not client.server_capabilities.documentFormattingProvider then
            return
        end

        -- Tsserver usually works poorly. Sorry you work with bad languages
        -- You can remove this line if you know what you"re doing :)
        -- Very nice decision xD
        if client.name == "tsserver" then
            return
        end

        -- Create an autocmd that will run *before* we save the buffer.
        --  Run the formatting command for the LSP that has just attached.
        autocmd("BufWritePre", {
            group = get_augroup(client),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format {
                    async = false,
                    filter = function(c)
                        return c.id == client.id
                    end,
                }
            end,
        })
    end,
})

-- remove extra spaces
autocmd("BufWritePre", {
    group = dark_magic,
    pattern = "*",
    command = [[%s/\s\+$//e]]
})

-- remove trailing lines
autocmd("BufWritePre", {
    group = dark_magic,
    pattern = "*",
    command = [[%s/$\n\+\%$//e]]
})

autocmd('TextYankPost', {
    group = augroup('YankHighlight', { clear = true }),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end,
})
