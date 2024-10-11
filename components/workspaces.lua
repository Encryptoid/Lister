local M = {}

local os = require 'leelua.os'
local types = require 'types'

M.Name = "workspaces"

M.fields = {
    {
        name = "Name",
        type = types.TEXT,
        init = true,
        null = false,
    },
    {
        name = "Shortcut",
        type = types.TEXT,
        init = true,
        null = false,
        short = "sc",
    },
    {
        name = "Path",
        type = types.DIR,
        null = false,
        init = function (o)
            return os.cwd()
        end
    }
}

for k, v in pairs(M.fields) do
    if k == "path" then
        print(v.init())
    end
end

return M
