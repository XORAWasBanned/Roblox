-- Path: CorePackages.Packages._Index.Dash.Dash.assertEqual
-- https://lua.expert

local Parent = script.Parent

local function assertEqual(p1, p2, p3) -- line: 12
    -- upvalues: Parent (copy)
    if p1 == p2 then
        return
    end

    require(Parent.Error).new("AssertError", p3 or ("Left \"%*\" does not equal right \"%*\""):format(p1, p2)):throw({
        left = p1,
        right = p2
    })
end

return assertEqual
