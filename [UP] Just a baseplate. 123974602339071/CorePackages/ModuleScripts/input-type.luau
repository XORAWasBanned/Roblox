-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.input-type
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local LuauPolyfill = require(ParentParent.LuauPolyfill)
local Boolean, Error, Object = LuauPolyfill.Boolean, LuauPolyfill.Error, LuauPolyfill.Object
local t1 = {}

require(script.Parent["merge-typedefs_types"])

local Kind = require(ParentParent.GraphQL).Kind
local mergeFields = require(script.Parent.fields).mergeFields
local mergeDirectives = require(script.Parent.directives).mergeDirectives

function t1.mergeInputType(p1, p2, p3) -- line: 29
    -- upvalues: Boolean (copy), Error (copy), Object (copy), Kind (copy), mergeFields (copy), mergeDirectives (copy)
    if Boolean.toJSBoolean(p2) then
        local function v1() -- line: 37
            -- upvalues: p1 (copy), p2 (copy), p3 (copy), Boolean (copy), mergeFields (copy), mergeDirectives (copy)
            return {
                name = p1.name,
                description = if Boolean.toJSBoolean(p1.description) then p1.description else p2.description,
                kind = not Boolean.toJSBoolean(p3 and p3.convertExtensions) and p1.kind ~= "InputObjectTypeDefinition" and p2.kind ~= "InputObjectTypeDefinition" and "InputObjectTypeExtension" or "InputObjectTypeDefinition",
                loc = p1.loc,
                fields = mergeFields(p1, p1.fields, p2.fields, p3),
                directives = mergeDirectives(p1.directives, p2.directives, p3)
            }
        end

        local ok, result = pcall(v1)

        if not ok then
            error(Error.new(("Unable to merge GraphQL input type \"%s\": %s"):format(tostring(p1.name.value), (tostring(result.message)))))
        end

        return result
    end

    if not (p3 and Boolean.toJSBoolean(p3.convertExtensions)) then
        return p1
    end

    return (Object.assign({}, p1, {
        kind = Kind.INPUT_OBJECT_TYPE_DEFINITION
    }))
end

return t1
