-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.astFromValue
-- https://lua.expert

local ParentParent = script.Parent.Parent
local ParentParent2, luaUtils = ParentParent.Parent, ParentParent.luaUtils
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Error, Number = LuauPolyfill.Error, LuauPolyfill.Number
local RegExp = require(ParentParent2.RegExp)
local inspect = require(ParentParent.jsutils.inspect).inspect
local invariant = require(ParentParent.jsutils.invariant).invariant
local isObjectLike = require(ParentParent.jsutils.isObjectLike).isObjectLike
local isIteratableObject = require(ParentParent.jsutils.isIteratableObject).isIteratableObject

require(ParentParent.language.ast)

local Kind = require(ParentParent.language.kinds).Kind
local GraphQLID = require(ParentParent.type.scalars).GraphQLID
local definition = require(ParentParent.type.definition)
local isLeafType, isEnumType, isInputObjectType, isListType = definition.isLeafType, definition.isEnumType, definition.isInputObjectType, definition.isListType
local isNonNullType = definition.isNonNullType
local null = require(luaUtils.null)
local isNillish = require(luaUtils.isNillish)
local isNillish2, isNotNillish = isNillish.isNillish, isNillish.isNotNillish
local v1, astFromValue

local function astFromValue2(p1, p2) -- line: 70
    -- upvalues: Error (copy), Number (copy), inspect (copy), invariant (copy), isObjectLike (copy), isIteratableObject (copy), Kind (copy), GraphQLID (copy), isLeafType (copy), isEnumType (copy), isInputObjectType (copy), isListType (copy), isNonNullType (copy), null (copy), isNillish2 (copy), isNotNillish (copy), v1 (ref), astFromValue (ref)
    if isNonNullType(p2) then
        local v2 = astFromValue(p1, p2.ofType)

        if (v2 ~= nil and v2 ~= null and v2.kind) == Kind.NULL then
            return null
        end

        return v2
    end

    if p1 == null then
        return {
            kind = Kind.NULL
        }
    end

    if p1 == nil then
        return null
    end

    if isListType(p2) then
        local ofType = p2.ofType

        if not isIteratableObject(p1) then
            return astFromValue(p1, ofType)
        end

        local t1 = {}

        for _, v3 in pairs(p1) do
            local v4 = astFromValue(v3, ofType)

            if isNotNillish(v4) then
                table.insert(t1, v4)
            end
        end

        return {
            kind = Kind.LIST,
            values = t1
        }
    end

    if isInputObjectType(p2) then
        if not isObjectLike(p1) then
            return null
        end

        local t2 = {}

        for _, v5 in ipairs(p2:getFields():values()) do
            local v6 = astFromValue(p1[v5.name], v5.type)

            if isNotNillish(v6) then
                table.insert(t2, {
                    kind = Kind.OBJECT_FIELD,
                    name = {
                        kind = Kind.NAME,
                        value = v5.name
                    },
                    value = v6
                })
            end
        end

        return {
            kind = Kind.OBJECT,
            fields = t2
        }
    end

    if isLeafType(p2) then
        local v7 = p2:serialize(p1)

        if isNillish2(v7) then
            return null
        end

        if typeof(v7) == "boolean" then
            return {
                kind = Kind.BOOLEAN,
                value = v7
            }
        end

        if typeof(v7) == "number" and Number.isFinite(v7) then
            local v8 = tostring(v7)

            if v1:test(v8) then
                return {
                    kind = Kind.INT,
                    value = v8
                }
            end

            return {
                kind = Kind.FLOAT,
                value = v8
            }
        end

        if typeof(v7) == "string" then
            if isEnumType(p2) then
                return {
                    kind = Kind.ENUM,
                    value = v7
                }
            end

            if p2 ~= GraphQLID or not v1:test(v7) then
                return {
                    kind = Kind.STRING,
                    value = v7
                }
            end

            return {
                kind = Kind.INT,
                value = v7
            }
        end

        error(Error.new(("Cannot convert value to AST: %s."):format(inspect(v7))))
    end

    invariant(false, "Unexpected input type: " .. inspect(p2))
end

astFromValue = astFromValue2
v1 = RegExp("^-?(?:0|[1-9][0-9]*)$")

return {
    astFromValue = astFromValue2,
    NULL = null
}
