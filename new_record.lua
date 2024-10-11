local M = {}

local tblu = require 'leelua.tblu'
local types = require 'types'

local function get_init(fields)
    local init = {}
    for k, v in ipairs(fields) do
        if v.init then
            table.insert(init, v)
            if v.type == types.BOOL then
                if type(v.init) ~= "boolean" and type(init) ~= "function" then
                    print("List template note configured correctly. Type was bool, but init was not bool or function")
                    os.exit()
                end
            end
        end
    end
    return init
end

M.new_record = function(fields)
    local init = get_init(fields)
    local rec = {}
    local o = {}
    for k, v in ipairs(init) do
        local val

        if false then
        elseif v.type == types.TEXT and v.init == true then
            io.write("Input " .. v.name .. ": ")
            val = io.read()
        elseif v.init and type(v.init) == "function" then
            val = v.init(o)
            print("Evaluated " .. v.name .. ": " .. val)
        end

        rec[v.name] = val
        o.fields = rec
    end

    return rec
end

return M
