return function()
    local dap = require("dap")
    dap.adapters = {
        cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = "/Users/micuks/.local/share/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
            name = "cppdbg",
        },
        codelldb = {
            type = "server",
            host = "127.0.0.1",
            port = "13000",
            executable = {
                command = '/Users/micuks/.local/share/codelldb/extension/adapter/codelldb',
                args = { "--port", "13000" },
            },
        }
    }
    dap.configurations = {
        cpp = { {
            name = "Launch (choose debug file manually)",
            type = "codelldb",
            request = "launch",
            program = function()
                -- return vim.fn.input("Path to executable: ", vim.fn.expand "%:p", "file")
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = true,
            -- runInTerminal = true,
            -- externalTerminal = true,
            setupCommands = {
                {
                    text = "-enable-pretty-printing",
                    description = "enable pretty printing",
                    ignoreFailures = false,
                }
            },
        } },
    }

    -- Get notify
    local function start_session(_, _)
        local info_string = string.format("%s", dap.session().config.program)
        vim.notify(info_string, "debug", { title = "Debugger Started", timeout = 500 })
    end

    local function terminate_session(_, _)
        local info_string = string.format("%s", dap.session().config.program)
        vim.notify(info_string, "debug", { title = "Debugger Terminated", timeout = 500 })
    end

    dap.listeners.after.event_initialized["dapui"] = start_session
    dap.listeners.before.event_terminated["dapui"] = terminate_session

    -- Define symbols
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
    vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })
end
