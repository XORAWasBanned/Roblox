-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.ScalarLeafsRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local jsutils = ParentParent.jsutils
local inspect = require(jsutils.inspect).inspect
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local definition = require(ParentParent.type.definition)
local getNamedType, isLeafType = definition.getNamedType, definition.isLeafType

return {
    ScalarLeafsRule = function(p1) -- line: 25
        -- upvalues: inspect (copy), GraphQLError (copy), getNamedType (copy), isLeafType (copy)
        return {
            Field = function(_, p3) -- Field | line: 27
                -- upvalues: p1 (copy), inspect (copy), GraphQLError (copy), getNamedType (copy), isLeafType (copy)
                local v1 = p1:getType()
                local selectionSet = p3.selectionSet

                if v1 then
                    if isLeafType(getNamedType(v1)) then
                        if selectionSet then
                            local value = p3.name.value
                            local v2 = inspect(v1)

                            p1:reportError(GraphQLError.new(("Field \"%s\" must not have a selection since type \"%s\" has no subfields."):format(value, v2), selectionSet))
                        end
                    elseif not selectionSet then
                        local value = p3.name.value
                        local v3 = inspect(v1)

                        p1:reportError(GraphQLError.new(("Field \"%s\" of type \"%s\" must have a selection of subfields. Did you mean \"%s { ... }\"?"):format(value, v3, value), p3))
                    end
                end
            end
        }
    end
}
