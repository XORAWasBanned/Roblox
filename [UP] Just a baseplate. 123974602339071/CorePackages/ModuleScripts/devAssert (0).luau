-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.devAssert
-- https://lua.expert

return {
    devAssert = function(p1, p2) -- devAssert | line: 9
        if not p1 then
            error(p2, 2)
        end
    end
}
