-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.NoUnusedVariablesRule
-- https://lua.expert

local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
    NoUnusedVariablesRule = function(p1) -- NoUnusedVariablesRule | line: 20
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
                    local t5 = {}
                    local v1 = p1:getRecursiveVariableUsages(p3)

                    for _, v2 in ipairs(v1) do
                        t5[v2.node.name.value] = true
                    end

                    for _, v3 in ipairs(t2) do
                        local value = v3.variable.name.value

                        if t5[value] ~= true then
                            p1:reportError(GraphQLError.new(p3.name and ("Variable \"$%s\" is never used in operation \"%s\"."):format(value, p3.name.value) or ("Variable \"$%s\" is never used."):format(value), v3))
                        end
                    end
                end
            },
            VariableDefinition = function(_, p5) -- VariableDefinition | line: 55
                -- upvalues: t2 (ref)
                table.insert(t2, p5)
            end
        }
    end
}
