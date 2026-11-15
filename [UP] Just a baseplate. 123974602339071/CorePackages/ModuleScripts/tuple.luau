-- Path: CorePackages.Packages._Index.mock-31ab8d40-1.1.0.mock.tuple
-- https://lua.expert

local symbols = require(script.Parent.symbols)

return function(...) -- line: 3
    -- upvalues: symbols (copy)
    local t1 = { ... }

    assert(#t1 > 1, "Mock Error: tuple only accepts more than 1 value.")

    return (setmetatable({
        [symbols.isTuple] = true,
        values = t1
    }, {
        __tostring = function(_) -- __tostring | line: 11
            -- upvalues: t1 (copy)
            local t4 = {}

            for _, v2 in ipairs(t1) do
                table.insert(t4, (tostring(v2)))
            end

            return "<Tuple values=[" .. table.concat(t4, ", ") .. "]>"
        end
    }))
end
