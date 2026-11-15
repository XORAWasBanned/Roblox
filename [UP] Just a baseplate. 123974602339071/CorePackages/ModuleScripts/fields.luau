-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.fields
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local LuauPolyfill = require(ParentParent.LuauPolyfill)
local Array, Boolean, Error = LuauPolyfill.Array, LuauPolyfill.Boolean, LuauPolyfill.Error
local t1 = {}

require(script.Parent["merge-typedefs_types"])
require(ParentParent.GraphQL)

local utils = require(script.Parent.utils)
local extractType, isWrappingTypeNode, isListTypeNode, isNonNullTypeNode = utils.extractType, utils.isWrappingTypeNode, utils.isListTypeNode, utils.isNonNullTypeNode
local printTypeNode = utils.printTypeNode
local mergeDirectives = require(script.Parent.directives).mergeDirectives
local compareNodes = require(ParentParent.Utils).compareNodes
local mergeArguments = require(script.Parent.arguments).mergeArguments
local preventConflicts, safeChangeForFieldType

local function fieldAlreadyExists(p1, p2, p3) -- line: 48
    -- upvalues: Array (copy), Boolean (copy), Error (copy), extractType (copy)
    local v1 = Array.find(p1, function(p4) -- line: 51
        -- upvalues: p2 (copy)
        return p4.name.value == p2.name.value
    end)

    if not (not v1 or p3 and Boolean.toJSBoolean(p3.ignoreFieldConflicts)) then
        local v2 = extractType(v1.type)
        local v3 = extractType(p2.type)

        if v2.name.value ~= v3.name.value then
            error(Error.new(("Field \"%s\" already defined with a different type. Declared as \"%s\", but you tried to override with \"%s\""):format(tostring(p2.name.value), tostring(v2.name.value), (tostring(v3.name.value)))))
        end
    end

    return not not Boolean.toJSBoolean(v1)
end

function t1.mergeFields(p5, p6, p7, p8) -- line: 83
    -- upvalues: Array (copy), Boolean (copy), isNonNullTypeNode (copy), mergeDirectives (copy), compareNodes (copy), mergeArguments (copy), preventConflicts (ref), fieldAlreadyExists (copy)
    local v6 = {}

    if p7 ~= nil then
        v6 = Array.concat(v6, p7)
    end

    if p6 ~= nil then
        for _, v7 in p6 do
            if Boolean.toJSBoolean((fieldAlreadyExists(v6, v7, p8))) then
                local v8 = Array.find(v6, function(p9) -- line: 115
                    -- upvalues: v7 (copy)
                    return p9.name.value == v7.name.value
                end)

                if p8 then
                    if not Boolean.toJSBoolean(p8.ignoreFieldConflicts) then
                        if Boolean.toJSBoolean(p8.throwOnConflict) then
                            preventConflicts(p5, v8, v7, false)
                        else
                            preventConflicts(p5, v8, v7, true)
                        end

                        local toJSBoolean = Boolean.toJSBoolean
                        local v9 = isNonNullTypeNode(v7.type)

                        if Boolean.toJSBoolean(v9) then
                            v9 = not Boolean.toJSBoolean(isNonNullTypeNode(v8.type))
                        end

                        if toJSBoolean(v9) then
                            v8.type = v7.type
                        end
                    end
                else
                    preventConflicts(p5, v8, v7, true)

                    local toJSBoolean = Boolean.toJSBoolean
                    local v10 = isNonNullTypeNode(v7.type)

                    if Boolean.toJSBoolean(v10) then
                        v10 = not Boolean.toJSBoolean(isNonNullTypeNode(v8.type))
                    end

                    if toJSBoolean(v10) then
                        v8.type = v7.type
                    end
                end

                v8.arguments = mergeArguments(if Boolean.toJSBoolean(v7.arguments) then v7.arguments else {}, if Boolean.toJSBoolean(v8.arguments) then v8.arguments else {}, p8)
                v8.directives = mergeDirectives(v7.directives, v8.directives, p8)

                if Boolean.toJSBoolean(v7.description) then
                    v8.description = v7.description
                else
                    v8.description = v8.description
                end

                continue
            end

            table.insert(v6, v7)
        end
    end

    if p8 and Boolean.toJSBoolean(p8.sort) then
        Array.sort(v6, compareNodes)
    end

    if p8 and p8.exclusions then
        local exclusions = p8.exclusions

        return Array.filter(v6, function(p10) -- line: 183
            -- upvalues: p5 (copy), exclusions (copy), Array (copy), Boolean (copy)
            return not Boolean.toJSBoolean(Array.includes(exclusions, ("%s.%s"):format(tostring(p5.name.value), (tostring(p10.name.value)))))
        end)
    end

    return v6
end

function preventConflicts(p11, p12, p13, p14) -- line: 194
    -- upvalues: Boolean (copy), Error (copy), printTypeNode (copy), safeChangeForFieldType (ref)
    local v14 = p14 ~= nil and p14
    local v15 = printTypeNode(p12.type)
    local v16 = printTypeNode(p13.type)

    if v15 == v16 or Boolean.toJSBoolean(safeChangeForFieldType(p12.type, p13.type, v14)) then
        return
    end

    error(Error.new(("Field '%s.%s' changed type from '%s' to '%s'"):format(tostring(p11.name.value), tostring(p12.name.value), tostring(v15), (tostring(v16)))))
end

function safeChangeForFieldType(p15, p16, p17) -- line: 223
    -- upvalues: Boolean (copy), isWrappingTypeNode (copy), isListTypeNode (copy), isNonNullTypeNode (copy), safeChangeForFieldType (ref)
    local v18 = p17 ~= nil and p17

    if Boolean.toJSBoolean(isWrappingTypeNode(p15)) or Boolean.toJSBoolean(isWrappingTypeNode(p16)) then
        if Boolean.toJSBoolean(isNonNullTypeNode(p16)) then
            local v19 = if Boolean.toJSBoolean(isNonNullTypeNode(p15)) then p15.type else p15

            return safeChangeForFieldType(v19, p16.type)
        end

        if Boolean.toJSBoolean(isNonNullTypeNode(p15)) then
            return safeChangeForFieldType(p16, p15, v18)
        end

        if not Boolean.toJSBoolean(isListTypeNode(p15)) then
            return false
        end

        return isListTypeNode(p16) and safeChangeForFieldType(p15.type, p16.type) or isNonNullTypeNode(p16) and safeChangeForFieldType(p15, p16.type)
    end

    if typeof(p15) == "table" and #p15 == 0 and typeof(p16) == "table" and #p16 == 0 then
        return true
    end

    return tostring(p15) == tostring(p16)
end

return t1
