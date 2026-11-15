-- Path: CoreGui.RobloxGui.Modules.DevConsole.Util.maxOfTable
-- https://lua.expert

return function(p1, p2) -- line: 2
    local t1 = {}

    for v1, v2 in pairs(p1) do
        if not p2[v1] then
            error("tables did not have matching indices")

            return
        end

        t1[v1] = v2 < p2[v1] and p2[v1] or v2
    end

    return t1
end
