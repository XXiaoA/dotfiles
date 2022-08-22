local nmap = require("core.keymap").set_keymap("n")

local function run_code()
    local file = vim.api.nvim_buf_get_name(0)
    local file_type = vim.api.nvim_buf_get_option(0, "filetype")

    if file_type == "lua" then
        vim.cmd("so")
    elseif file_type == "rust" then
        vim.cmd("RustRun")
    elseif file_type == "python" then
        vim.notify(vim.fn.system("python3 " .. file))
    elseif file_type == "fish" then
        vim.notify(vim.fn.system("fish " .. file))
    end
end

nmap("<F5>", run_code, { desc = "Run code" })
