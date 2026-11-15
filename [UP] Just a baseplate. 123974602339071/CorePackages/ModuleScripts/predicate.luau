-- Path: CorePackages.Packages._Index.mock-31ab8d40-1.1.0.mock.predicate
-- https://lua.expert

local symbols = require(script.Parent.symbols)

return function(p1) -- line: 3
    -- upvalues: symbols (copy)
    assert(type(p1) == "function", "Mock Error: Mock.predicate must be given a function")

    return (setmetatable({
        [symbols.isPredicate] = true,
        predicate = p1
    }, {
        __tostring = function() -- __tostring | line: 10
            return "<Predicate>"
        end
    }))
end
