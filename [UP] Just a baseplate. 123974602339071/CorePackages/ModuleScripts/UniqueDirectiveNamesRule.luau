-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.UniqueDirectiveNamesRule
-- https://lua.expert

local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
    UniqueDirectiveNamesRule = function(p1) -- line: 19
        -- upvalues: GraphQLError (copy)
        local t2 = {}
        local v1 = p1:getSchema()

        return {
            DirectiveDefinition = function(_, p3) -- DirectiveDefinition | line: 24
                -- upvalues: p1 (copy), t2 (copy), v1 (copy), GraphQLError (copy)
                local value = p3.name.value

                if not (v1 and v1:getDirective(value)) then
                    if t2[value] then
                        p1:reportError(GraphQLError.new(("There can be only one directive named \"@%s\"."):format(value), {
                            t2[value],
                            p3.name
                        }))
                    else
                        t2[value] = p3.name
                    end

                    return false
                end

                p1:reportError(GraphQLError.new(("Directive \"@%s\" already exists in the schema. It cannot be redefined."):format(value), p3.name))
            end
        }
    end
}
