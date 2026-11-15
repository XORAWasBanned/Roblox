-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.UniqueFragmentNamesRule
-- https://lua.expert

local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
    UniqueFragmentNamesRule = function(p1) -- line: 19
        -- upvalues: GraphQLError (copy)
        local t2 = {}

        return {
            OperationDefinition = function() -- OperationDefinition | line: 23
                return false
            end,
            FragmentDefinition = function(_, p3) -- FragmentDefinition | line: 26
                -- upvalues: p1 (copy), t2 (copy), GraphQLError (copy)
                local value = p3.name.value

                if t2[value] then
                    p1:reportError(GraphQLError.new(("There can be only one fragment named \"%s\"."):format(value), {
                        t2[value],
                        p3.name
                    }))
                else
                    t2[value] = p3.name
                end

                return false
            end
        }
    end
}
