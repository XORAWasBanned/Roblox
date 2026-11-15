-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.UniqueVariableNamesRule
-- https://lua.expert

local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
    UniqueVariableNamesRule = function(p1) -- line: 19
        -- upvalues: GraphQLError (copy)
        local t2 = {}

        return {
            OperationDefinition = function() -- OperationDefinition | line: 22
                -- upvalues: t2 (ref)
                t2 = {}
            end,
            VariableDefinition = function(_, p3) -- VariableDefinition | line: 25
                -- upvalues: p1 (copy), t2 (ref), GraphQLError (copy)
                local value = p3.variable.name.value

                if t2[value] then
                    p1:reportError(GraphQLError.new(("There can be only one variable named \"$%s\"."):format(value), {
                        t2[value],
                        p3.variable.name
                    }))
                else
                    local t4 = t2

                    t4[value] = p3.variable.name
                end
            end
        }
    end
}
