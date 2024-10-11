local tblu = require 'leelua.tblu'
local path = require 'leelua.os'
path.pack()
local new = require 'new_record'

local function get_comp(comp_name)
    if comp_name then
        -- local mod = "lister.components." .. comp_name
        -- local comp = require(mod)
        -- local comp_path = path.using("components."..comp_name)
        -- if not comp_path then
        --     print("Could not parse list name")
        --     return
        -- end
        -- return comp_path
    end
end

local function main()
    if #arg == 0 then
        print("no args")
        -- return
    end
    -- local comp_name = arg[1]
    local comp_name = "workspaces"
    local comp = require("components." .. comp_name)
    if not comp then
        print('Component "' .. comp_name .. '" not found.')
        return
    end

    local command = arg[2]
    if command and command:match("^-.*$") then
        if command == '-a' then
            local rec = new.new_record(comp.fields)
            tblu.print(rec)
        end
    end
end
main()
