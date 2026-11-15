-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.FragmentsOnCompositeTypesRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local language = ParentParent.language
local print = require(language.printer).print
local isCompositeType = require(ParentParent.type.definition).isCompositeType
local typeFromAST = require(ParentParent.utilities.typeFromAST).typeFromAST

return {
    FragmentsOnCompositeTypesRule = function(p1) -- line: 24
        -- upvalues: GraphQLError (copy), print (copy), isCompositeType (copy), typeFromAST (copy)
        return {
            InlineFragment = function(_, p3) -- InlineFragment | line: 26
                -- upvalues: p1 (copy), GraphQLError (copy), print (copy), isCompositeType (copy), typeFromAST (copy)
                local typeCondition = p3.typeCondition

                if typeCondition then
                    local v1 = typeFromAST(p1:getSchema(), typeCondition)

                    if v1 and not isCompositeType(v1) then
                        local v2 = print(typeCondition)

                        p1:reportError(GraphQLError.new(("Fragment cannot condition on non composite type \"%s\"."):format(v2), typeCondition))
                    end
                end
            end,
            FragmentDefinition = function(_, p5) -- FragmentDefinition | line: 43
                -- upvalues: p1 (copy), GraphQLError (copy), print (copy), isCompositeType (copy), typeFromAST (copy)
                local v3 = typeFromAST(p1:getSchema(), p5.typeCondition)

                if v3 and not isCompositeType(v3) then
                    local v4 = print(p5.typeCondition)

                    p1:reportError(GraphQLError.new(("Fragment \"%s\" cannot condition on non composite type \"%s\"."):format(p5.name.value, v4), p5.typeCondition))
                end
            end
        }
    end
}
