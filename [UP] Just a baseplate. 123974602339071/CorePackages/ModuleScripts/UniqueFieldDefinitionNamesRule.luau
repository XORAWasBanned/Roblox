-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.UniqueFieldDefinitionNamesRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local ParentParent2 = ParentParent.Parent
local Map = require(ParentParent2.LuauPolyfill).Map
local isNotNillish = require(ParentParent.luaUtils.isNillish).isNotNillish
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local definition = require(ParentParent.type.definition)
local isObjectType, isInterfaceType, isInputObjectType = definition.isObjectType, definition.isInterfaceType, definition.isInputObjectType
local hasField
local t1 = {
    UniqueFieldDefinitionNamesRule = function(p1) -- line: 32
        -- upvalues: Map (copy), GraphQLError (copy), hasField (ref)
        local v1 = p1:getSchema()
        local v2 = v1 and v1:getTypeMap() or Map.new()
        local t2 = {}

        local function checkFieldUniqueness(_, p3) -- line: 40
            -- upvalues: p1 (copy), v2 (copy), t2 (copy), GraphQLError (copy), hasField (ref)
            local value = p3.name.value

            if not t2[value] then
                t2[value] = {}
            end

            local v3 = p3.fields or {}
            local v4 = t2[value]

            for _, v5 in ipairs(v3) do
                local value2 = v5.name.value

                if hasField(v2:get(value), value2) then
                    p1:reportError(GraphQLError.new(("Field \"%s.%s\" already exists in the schema. It cannot also be defined in this type extension."):format(value, value2), v5.name))
                elseif v4[value2] then
                    p1:reportError(GraphQLError.new(("Field \"%s.%s\" can only be defined once."):format(value, value2), {
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
            InputObjectTypeDefinition = checkFieldUniqueness,
            InputObjectTypeExtension = checkFieldUniqueness,
            InterfaceTypeDefinition = checkFieldUniqueness,
            InterfaceTypeExtension = checkFieldUniqueness,
            ObjectTypeDefinition = checkFieldUniqueness,
            ObjectTypeExtension = checkFieldUniqueness
        }
    end
}

function hasField(p4, p5) -- line: 88
    -- upvalues: isNotNillish (copy), isObjectType (copy), isInterfaceType (copy), isInputObjectType (copy)
    if not isObjectType(p4) and not isInterfaceType(p4) and not isInputObjectType(p4) then
        return false
    end

    return isNotNillish(p4:getFields():get(p5))
end

return t1
