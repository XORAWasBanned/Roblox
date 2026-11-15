-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.UniqueOperationNamesRule
-- https://lua.expert

local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
    UniqueOperationNamesRule = function(p1) -- line: 19
        -- upvalues: GraphQLError (copy)
        local t3 = {}

        return {
            OperationDefinition = function(_, p3) -- OperationDefinition | line: 22
                -- upvalues: p1 (copy), t3 (copy), GraphQLError (copy)
                local name = p3.name

                if name then
                    if t3[name.value] then
                        p1:reportError(GraphQLError.new(("There can be only one operation named \"%s\"."):format(name.value), {
                            t3[name.value],
                            name
                        }))
                    else
                        t3[name.value] = name
                    end
                end

                return false
            end,
            FragmentDefinition = function() -- FragmentDefinition | line: 40
                return false
            end
        }
    end
}
