return {
    'mfussenegger/nvim-dap',
    opts = {},
    config = function()
        local dap = require("dap")
        dap.configurations.java = {
            {
                type = 'java',
                request = 'attach',
                name = "Debug (5005) - Gradle",
                hostName = "127.0.0.1",
                port = 5005,
            },
            {
                type = 'java',
                request = 'attach',
                name = "Debug (8000) - Maven",
                hostName = "127.0.0.1",
                port = 8000,
            },
        }
    end,
}
