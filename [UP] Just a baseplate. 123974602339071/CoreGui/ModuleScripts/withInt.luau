-- Path: CoreGui.RobloxGui.Modules.InGameMenu.TestHelpers.withInt
-- https://lua.expert

local function withInt(p1, p2, p3) -- line: 4
    local v1 = game:SetFastIntForTesting(p1, p2)
    local ok, result = pcall(p3)

    game:SetFastIntForTesting(p1, v1)

    if not ok then
        error(result)
    end
end

return withInt
