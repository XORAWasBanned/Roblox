-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.UniqueTypeNamesRule
-- https://lua.expert

local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
    UniqueTypeNamesRule = function(p1) -- line: 19
        -- upvalues: GraphQLError (copy)
        local t2 = {}
        local v1 = p1:getSchema()

        local function checkTypeName(_, p3) -- line: 25
            -- upvalues: p1 (copy), t2 (copy), v1 (copy), GraphQLError (copy)
            local value = p3.name.value

            if not (v1 and v1:getType(value)) then
                if t2[value] then
                    p1:reportError(GraphQLError.new(("There can be only one type named \"%s\"."):format(value), {
                        t2[value],
                        p3.name
                    }))
                else
                    t2[value] = p3.name
                end

                return false
            end

            p1:reportError(GraphQLError.new(("Type \"%s\" already exists in the schema. It cannot also be defined in this type definition."):format(value), p3.name))
        end

        return {
            ScalarTypeDefinition = checkTypeName,
            ObjectTypeDefinition = checkTypeName,
            InterfaceTypeDefinition = checkTypeName,
            UnionTypeDefinition = checkTypeName,
            EnumTypeDefinition = checkTypeName,
            InputObjectTypeDefinition = checkTypeName
        }
    end
}
