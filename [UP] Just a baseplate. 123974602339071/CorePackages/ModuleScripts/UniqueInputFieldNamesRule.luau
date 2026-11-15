-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.UniqueInputFieldNamesRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError

require(ParentParent.language.visitor)
require(script.Parent.Parent.ValidationContext)

local language = ParentParent.language

require(language.ast)

return {
    UniqueInputFieldNamesRule = function(p1) -- line: 30
        -- upvalues: GraphQLError (copy)
        local t2 = {}
        local v1 = {}

        return {
            ObjectValue = {
                enter = function() -- enter | line: 36
                    -- upvalues: t2 (copy), v1 (ref)
                    table.insert(t2, v1)
                    v1 = {}
                end,
                leave = function() -- leave | line: 40
                    -- upvalues: t2 (copy), v1 (ref)
                    v1 = table.remove(t2)
                end
            },
            ObjectField = function(_, p3) -- ObjectField | line: 45
                -- upvalues: p1 (copy), v1 (ref), GraphQLError (copy)
                local value = p3.name.value

                if v1[value] then
                    p1:reportError(GraphQLError.new(("There can be only one input field named \"%s\"."):format(value), {
                        v1[value],
                        p3.name
                    }))
                else
                    local v3 = v1

                    v3[value] = p3.name
                end
            end
        }
    end
}
