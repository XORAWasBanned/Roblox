-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.UniqueEnumValueNamesRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local ParentParent2 = ParentParent.Parent
local Map = require(ParentParent2.LuauPolyfill).Map
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local isEnumType = require(ParentParent.type.definition).isEnumType

return {
    UniqueEnumValueNamesRule = function(p1) -- line: 25
        -- upvalues: Map (copy), GraphQLError (copy), isEnumType (copy)
        local v1 = p1:getSchema()
        local v2 = v1 and v1:getTypeMap() or Map.new()
        local t2 = {}

        local function checkValueUniqueness(_, p3) -- line: 33
            -- upvalues: p1 (copy), v2 (copy), t2 (copy), GraphQLError (copy), isEnumType (copy)
            local value = p3.name.value

            if not t2[value] then
                t2[value] = {}
            end

            local v3 = p3.values or {}
            local v4 = t2[value]

            for _, v5 in ipairs(v3) do
                local value2 = v5.name.value
                local v6 = v2:get(value)

                if isEnumType(v6) and v6:getValue(value2) then
                    p1:reportError(GraphQLError.new(("Enum value \"%s.%s\" already exists in the schema. It cannot also be defined in this type extension."):format(value, value2), v5.name))
                elseif v4[value2] then
                    p1:reportError(GraphQLError.new(("Enum value \"%s.%s\" can only be defined once."):format(value, value2), {
                        v4[value2],
                        v5.name
                    }))
                else
                    v4[value2] = v5.name
                end
            end

            return false
        end

        return {
            EnumTypeDefinition = checkValueUniqueness,
            EnumTypeExtension = checkValueUniqueness
        }
    end
}
