local M = {}

local os = require 'leelua.os'

M.Name = "tasks"

local types = {
    TEXT = 1,
    BOOL = 2,
    LINK = 3,
    DIR = 4,
    FILE = 5,
    LIST = 6,
    -- TODO EXEC, cmd template, maybe from M.exec?
}

M.pre = function()
end

M.post = function()
end

    -- task[consts.Current] = false
    -- task[consts.Prio] = u.str(json.get_lowest_prio() + 1)
    --
    -- task[consts.Project] = ""
    -- task[consts.Name] = ""
    -- task[consts.Desc] = ""
    -- task[consts.Type] = ""
    -- task[consts.Status] = "TODO"
    --
    -- task[consts.Ticket] = ""
    -- task[consts.Git] = ""
    -- task[consts.Conf] = ""
    -- task[consts.Octo] = ""
    -- task[consts.Release] = ""
    -- task[consts.Merge] = ""
    --
    -- task[consts.Notes] = ""
    -- task[consts.Testing] = ""

M.status = {
    TODO = "TODO",
    DONE = "DONE",
    NONE = "NONE"
}

local notes_dir = ""

M.fields = {
    current = {
        type = types.BOOL,
        init = function() return false end,
        null = false,
    },
    project = {
        type = types.LIST,
        init = true,
        null = false,
    },
    name = {
        type = types.TEXT,
        null = false,
        init = true,
    },
    desc = {
        type = types.TEXT,
        null = false,
        init = true,
    },
    status = {
        type = M.status,
        null = false,
        init = M.status.TODO,
    },
    notes = {
        -- TODO Way to specify if the file should be created
        type = types.FILE,
        base_dir = notes_dir,
        name = "{name}_notes.md"
    },
}

for k, v in pairs(M.fields) do
    if k == "path" then
        print(v.init())
    end
end

return M
