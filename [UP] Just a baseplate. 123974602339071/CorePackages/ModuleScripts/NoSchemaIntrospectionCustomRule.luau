-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.custom.NoSchemaIntrospectionCustomRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent.Parent
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local getNamedType = require(ParentParent.type.definition).getNamedType
local isIntrospectionType = require(ParentParent.type.introspection).isIntrospectionType

return {
    NoSchemaIntrospectionCustomRule = function(p1) -- line: 27
        -- upvalues: GraphQLError (copy), getNamedType (copy), isIntrospectionType (copy)
        return {
            Field = function(_, p3) -- Field | line: 29
                -- upvalues: p1 (copy), GraphQLError (copy), getNamedType (copy), isIntrospectionType (copy)
                local v1 = getNamedType(p1:getType())

                if v1 and isIntrospectionType(v1) then
                    p1:reportError(GraphQLError.new(("GraphQL introspection has been disabled, but the requested query contained the field \"%s\"."):format(p3.name.value), p3))
                end
            end
        }
    end
}
