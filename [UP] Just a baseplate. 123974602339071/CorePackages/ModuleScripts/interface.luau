-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.interface
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local LuauPolyfill = require(ParentParent.LuauPolyfill)
local Boolean, Error, Object = LuauPolyfill.Boolean, LuauPolyfill.Error, LuauPolyfill.Object
local t1 = {}

require(script.Parent["merge-typedefs_types"])

local Kind = require(ParentParent.GraphQL).Kind
local mergeFields = require(script.Parent.fields).mergeFields
local mergeDirectives = require(script.Parent.directives).mergeDirectives
local mergeNamedTypeArray = require(script.Parent["merge-named-type-array"]).mergeNamedTypeArray

function t1.mergeInterface(p1, p2, p3) -- line: 31
    -- upvalues: Boolean (copy), Error (copy), Object (copy), Kind (copy), mergeFields (copy), mergeDirectives (copy), mergeNamedTypeArray (copy)
    if Boolean.toJSBoolean(p2) then
        local function v1() -- line: 40
            -- upvalues: p1 (copy), p2 (copy), p3 (copy), Boolean (copy), mergeFields (copy), mergeDirectives (copy), mergeNamedTypeArray (copy)
            return {
                name = p1.name,
                description = if Boolean.toJSBoolean(p1.description) then p1.description else p2.description,
                kind = not Boolean.toJSBoolean(p3 and p3.convertExtensions) and p1.kind ~= "InterfaceTypeDefinition" and p2.kind ~= "InterfaceTypeDefinition" and "InterfaceTypeExtension" or "InterfaceTypeDefinition",
                loc = p1.loc,
                fields = mergeFields(p1, p1.fields, p2.fields, p3),
                directives = mergeDirectives(p1.directives, p2.directives, p3),
                interfaces = if Boolean.toJSBoolean(p1.interfaces) then mergeNamedTypeArray(p1.interfaces, p2.interfaces, p3) else nil
            }
        end

        local ok, result = pcall(v1)

        if not ok then
            error(Error.new(("Unable to merge GraphQL interface \"%s\": %s"):format(tostring(p1.name.value), (tostring(result.message)))))
        end

        return result
    end

    if Boolean.toJSBoolean(if typeof(p3) == "table" then p3.convertExtensions else nil) then
        return (Object.assign({}, p1, {
            kind = Kind.INTERFACE_TYPE_DEFINITION
        }))
    end

    return p1
end

return t1
