-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.invariant
-- https://lua.expert

return {
    invariant = function(p1, p2) -- invariant | line: 8
        if not p1 then
            error(p2 or "Unexpected invariant triggered.")
        end
    end
}
