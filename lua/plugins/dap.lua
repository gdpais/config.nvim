return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "leoluz/nvim-dap-go",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
            -- {
            --     "jay-babu/mason-nvim-dap.nvim",
            --     opts = {
            --         ensure_installed = { "python", "delve", "javadbg" }
            --     }
            -- },
        },
        config = function()
            local dap = require "dap"
            local dap_ui = require "dapui"

            dap_ui.setup()
            require "dap-go".setup()

            require("nvim-dap-virtual-text").setup {
                -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
                display_callback = function(variable)
                    local name = string.lower(variable.name)
                    local value = string.lower(variable.value)
                    if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
                        return "*****"
                    end

                    if #variable.value > 15 then
                        return " " .. string.sub(variable.value, 1, 15) .. "... "
                    end

                    return " " .. variable.value
                end,
            }

            vim.keymap.set("n", "<F4>", function() dap_ui.toggle() end)
            --vim.keymap.set("n", "<F5>", function() dap_ui.toggle(2) end)
            vim.keymap.set("n", "<space>du", function()
                dap_ui.eval(nil, { enter = true })
            end)
            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<Leader>B", function()
                dap.set_breakpoint(vim.fn.input('Breakpoint cond: '))
            end)
            vim.keymap.set("n", "<space>db", dap.run_to_cursor)
            vim.keymap.set("n", "<Up>", dap.continue)
            vim.keymap.set("n", "<Right>", dap.step_into)
            vim.keymap.set("n", "<Down>", dap.step_over)
            vim.keymap.set("n", "<Left>", dap.step_out)
            vim.keymap.set("n", "<F5>", dap.step_back)
            vim.keymap.set("n", "<F1>", dap.restart)

            dap.listeners.before.attach.dapui_config = function()
                dap_ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dap_ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dap_ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dap_ui.close()
            end
        end
    },

}
