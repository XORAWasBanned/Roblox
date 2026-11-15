-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.NoUnusedFragmentsRule
-- https://lua.expert

local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
    NoUnusedFragmentsRule = function(p1) -- NoUnusedFragmentsRule | line: 20
        -- upvalues: GraphQLError (copy)
        local t2 = {}
        local t3 = {}

        return {
            OperationDefinition = function(_, p3) -- OperationDefinition | line: 25
                -- upvalues: t2 (copy)
                table.insert(t2, p3)

                return false
            end,
            FragmentDefinition = function(_, p5) -- FragmentDefinition | line: 29
                -- upvalues: t3 (copy)
                table.insert(t3, p5)

                return false
            end,
            Document = {
                leave = function() -- leave | line: 34
                    -- upvalues: p1 (copy), t2 (copy), t3 (copy), GraphQLError (copy)
                    local t6 = {}

                    for _, v1 in ipairs(t2) do
                        for _, v2 in ipairs(p1:getRecursivelyReferencedFragments(v1)) do
                            t6[v2.name.value] = true
                        end
                    end

                    for _, v3 in ipairs(t3) do
                        local value = v3.name.value

                        if t6[value] ~= true then
                            p1:reportError(GraphQLError.new(("Fragment \"%s\" is never used."):format(value), v3))
                        end
                    end
                end
            }
        }
    end
}
