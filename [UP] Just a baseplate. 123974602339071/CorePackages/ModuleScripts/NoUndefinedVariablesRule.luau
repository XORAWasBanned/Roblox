-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.NoUndefinedVariablesRule
-- https://lua.expert

local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
    NoUndefinedVariablesRule = function(p1) -- line: 20
        -- upvalues: GraphQLError (copy)
        local t2 = {}

        return {
            OperationDefinition = {
                enter = function() -- enter | line: 25
                    -- upvalues: t2 (ref)
                    t2 = {}
                end,
                leave = function(_, p3) -- leave | line: 28
                    -- upvalues: p1 (copy), t2 (ref), GraphQLError (copy)
                    local v1 = p1:getRecursiveVariableUsages(p3)

                    for _, v2 in ipairs(v1) do
                        local node = v2.node
                        local value = node.name.value

                        if t2[value] ~= true then
                            p1:reportError(GraphQLError.new(p3.name and ("Variable \"$%s\" is not defined by operation \"%s\"."):format(value, p3.name.value) or ("Variable \"$%s\" is not defined."):format(value), {
                                node,
                                p3
                            }))
                        end
                    end
                end
            },
            VariableDefinition = function(_, p5) -- VariableDefinition | line: 50
                -- upvalues: t2 (ref)
                local t5 = t2

                t5[p5.variable.name.value] = true
            end
        }
    end
}
