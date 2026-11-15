-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.KnownFragmentNamesRule
-- https://lua.expert

local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
    KnownFragmentNamesRule = function(p1) -- line: 19
        -- upvalues: GraphQLError (copy)
        return {
            FragmentSpread = function(_, p3) -- FragmentSpread | line: 21
                -- upvalues: p1 (copy), GraphQLError (copy)
                local value = p3.name.value

                if not p1:getFragment(value) then
                    p1:reportError(GraphQLError.new(("Unknown fragment \"%s\"."):format(value), p3.name))
                end
            end
        }
    end
}
