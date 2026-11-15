-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.directives
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local LuauPolyfill = require(ParentParent.LuauPolyfill)
local Array, Boolean, Error, Object = LuauPolyfill.Array, LuauPolyfill.Boolean, LuauPolyfill.Error, LuauPolyfill.Object
local t1 = {}
local print = require(ParentParent.GraphQL).print

require(script.Parent["merge-typedefs_types"])

local isSome = require(ParentParent.Utils).isSome
local deduplicateLists

local function directiveAlreadyExists(p1, p2) -- line: 43
    -- upvalues: Array (copy), Boolean (copy)
    return Boolean.toJSBoolean(Array.find(p1, function(p3) -- line: 49
        -- upvalues: p2 (copy)
        return p3.name.value == p2.name.value
    end))
end

local function nameAlreadyExists(p4, p5) -- line: 54
    -- upvalues: Array (copy)
    return Array.some(p5, function(p6) -- line: 55
        -- upvalues: p4 (copy)
        return p6.value == p4.value
    end)
end

local function mergeArguments(p7, p8) -- line: 60
    -- upvalues: Array (copy), Boolean (copy), deduplicateLists (ref)
    local v1 = Array.concat({}, p8)

    for _, v2 in p7 do
        local v3 = Array.findIndex(v1, function(p9) -- line: 73
            -- upvalues: v2 (copy)
            return p9.name.value == v2.name.value
        end)

        if v3 > -1 then
            local v4 = v1[v3]

            if v4.value.kind == "ListValue" then
                local values = v4.value.values
                local values2 = v2.value.values

                v4.value.values = deduplicateLists(values, values2, function(p10, p11) -- line: 87
                    -- upvalues: Array (copy), Boolean (copy)
                    local value = p10.value

                    return not Boolean.toJSBoolean(value) or not Array.some(p11, function(p12) -- line: 94
                        -- upvalues: value (copy)
                        return p12.value == value
                    end)
                end)
            else
                v4.value = v2.value
            end
        else
            table.insert(v1, v2)
        end
    end

    return v1
end

local function deduplicateDirectives(p13) -- line: 108
    -- upvalues: Array (copy), isSome (copy), mergeArguments (copy)
    return (Array.filter(Array.map(p13, function(p14, p15, p16) -- line: 112
        -- upvalues: Array (copy), mergeArguments (copy)
        local v5 = Array.findIndex(p16, function(p17) -- line: 114
            -- upvalues: p14 (copy)
            return p17.name.value == p14.name.value
        end)

        if v5 == p15 then
            return p14
        end

        local v6 = p16[v5]

        p14.arguments = mergeArguments(p14.arguments, v6.arguments)

        return nil
    end), isSome))
end

function t1.mergeDirectives(p18, p19, p20) -- line: 133
    -- upvalues: Array (copy), Boolean (copy), isSome (copy), directiveAlreadyExists (copy), mergeArguments (copy)
    local v7 = if p18 == nil then {} else p18
    local v8 = if p19 == nil then {} else p19
    local v9 = p20 and p20.reverseDirectives
    local v10 = if Boolean.toJSBoolean(v9) then v7 else v8

    if not Boolean.toJSBoolean(v9) then
        v8 = v7
    end

    local v11 = Array.concat({}, v10)
    local v12 = Array.filter(Array.map(v11, function(p21, p22, p23) -- line: 112
        -- upvalues: Array (copy), mergeArguments (copy)
        local v13 = Array.findIndex(p23, function(p24) -- line: 114
            -- upvalues: p21 (copy)
            return p24.name.value == p21.name.value
        end)

        if v13 == p22 then
            return p21
        end

        local v14 = p23[v13]

        p21.arguments = mergeArguments(p21.arguments, v14.arguments)

        return nil
    end), isSome)

    for _, v15 in v8 do
        if Boolean.toJSBoolean(directiveAlreadyExists(v12, v15)) then
            local v16 = Array.findIndex(v12, function(p25) -- line: 155
                -- upvalues: v15 (copy)
                return p25.name.value == v15.name.value
            end)
            local v17 = v12[v16]

            v12[v16].arguments = mergeArguments(Boolean.toJSBoolean(v15.arguments) and v15.arguments or {}, Boolean.toJSBoolean(v17.arguments) and v17.arguments or {})
        else
            table.insert(v12, v15)
        end
    end

    return v12
end

local function validateInputs(p26, p27) -- line: 176
    -- upvalues: Boolean (copy), Error (copy), Object (copy), print (copy)
    local v19 = print(Object.assign({}, p26, {
        description = Object.None
    }))
    local v20 = print(Object.assign({}, p27, {
        description = Object.None
    }))
    local v21 = v19:gsub("directive @w*d*", ""):gsub(" on .*$", "") == v20:gsub("directive @w*d*", ""):gsub(" on .*$", "")

    if Boolean.toJSBoolean(v21) then
        return
    end

    error(Error.new(("Unable to merge GraphQL directive \"%s\". \nExisting directive:  \n\t%s \nReceived directive: \n\t%s"):format(tostring(p26.name.value), tostring(v20), (tostring(v19)))))
end

function t1.mergeDirective(p28, p29) -- line: 201
    -- upvalues: Array (copy), Object (copy), validateInputs (copy)
    if not p29 then
        return p28
    end

    validateInputs(p28, p29)

    return Object.assign({}, p28, {
        locations = Array.concat({}, p29.locations, Array.filter(p28.locations, function(p30) -- line: 219
            -- upvalues: p29 (copy), Array (copy)
            local locations = p29.locations

            return not Array.some(locations, function(p31) -- line: 55
                -- upvalues: p30 (copy)
                return p31.value == p30.value
            end)
        end))
    })
end

function deduplicateLists(p32, p33, p34) -- line: 229
    -- upvalues: Array (copy)
    return Array.concat(p32, Array.filter(p33, function(p35) -- line: 247
        -- upvalues: p32 (copy), p34 (copy)
        return p34(p35, p32)
    end))
end

return t1
