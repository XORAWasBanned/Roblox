-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.UniqueArgumentNamesRule
-- https://lua.expert

local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
    UniqueArgumentNamesRule = function(p1) -- line: 20
        -- upvalues: GraphQLError (copy)
        local t2 = {}

        return {
            Field = function() -- Field | line: 24
                -- upvalues: t2 (ref)
                t2 = {}
            end,
            Directive = function() -- Directive | line: 27
                -- upvalues: t2 (ref)
                t2 = {}
            end,
            Argument = function(_, p3) -- Argument | line: 30
                -- upvalues: p1 (copy), t2 (ref), GraphQLError (copy)
                local value = p3.name.value

                if t2[value] then
                    p1:reportError(GraphQLError.new(("There can be only one argument named \"%s\"."):format(value), {
                        t2[value],
                        p3.name
                    }))
                else
                    local t4 = t2

                    t4[value] = p3.name
                end

                return false
            end
        }
    end
}
