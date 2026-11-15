-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.type.directives
-- https://lua.expert

local ParentParent = script.Parent.Parent
local ParentParent2 = ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Error, Map, Object = LuauPolyfill.Array, LuauPolyfill.Error, LuauPolyfill.Map, LuauPolyfill.Object
local coerceToMap = LuauPolyfill.coerceToMap

require(ParentParent.jsutils.ObjMap)
require(script.Parent.Parent.jsutils.ObjMap)

local inspect = require(script.Parent.Parent.jsutils.inspect).inspect
local toObjMap = require(script.Parent.Parent.jsutils.toObjMap).toObjMap
local devAssert = require(script.Parent.Parent.jsutils.devAssert).devAssert
local instanceOf = require(script.Parent.Parent.jsutils.instanceOf)
local isObjectLike = require(script.Parent.Parent.jsutils.isObjectLike).isObjectLike

require(script.Parent.Parent.language.ast)

local DirectiveLocation = require(script.Parent.Parent.language.directiveLocation).DirectiveLocation
local definition = require(script.Parent.definition)
local scalars = require(script.Parent.scalars)
local GraphQLString, GraphQLBoolean = scalars.GraphQLString, scalars.GraphQLBoolean
local argsToArgsConfig, GraphQLNonNull = definition.argsToArgsConfig, definition.GraphQLNonNull
local t1

function isDirective(p1) -- line: 53
    -- upvalues: instanceOf (copy), t1 (ref)
    return instanceOf(p1, t1)
end

function assertDirective(p2) -- line: 57
    -- upvalues: Error (copy), inspect (copy)
    if not isDirective(p2) then
        error(Error.new(("Expected %s to be a GraphQL directive."):format(inspect(p2))))
    end

    return p2
end

t1 = {}
t1.__index = t1

function t1.new(p3) -- line: 87
    -- upvalues: Array (copy), Map (copy), coerceToMap (copy), toObjMap (copy), devAssert (copy), instanceOf (copy), isObjectLike (copy), t1 (ref)
    local t2 = {
        name = p3.name,
        description = p3.description,
        locations = p3.locations,
        isRepeatable = not not p3.isRepeatable,
        extensions = p3.extensions and toObjMap(p3.extensions),
        astNode = p3.astNode
    }

    devAssert(p3.name, "Directive must be named.")
    devAssert(Array.isArray(p3.locations), ("@%s locations must be an Array."):format(p3.name))

    local v1 = if p3.args then p3.args else {}
    local v2, v3

    if isObjectLike(v1) then
        local v4 = Array.isArray(v1)

        if v4 then
            if next(v1) ~= nil then
                v3 = false
            else
                v2 = true
                v3 = true
            end
        else
            v2 = not v4
            v3 = true
        end
    else
        v3 = false
    end

    if not v3 then
        v2 = instanceOf(v1, Map)
    end

    devAssert(v2, ("@%s args must be an object with argument names as keys."):format(p3.name))
    t2.args = Array.map(coerceToMap(v1):entries(), function(p4) -- line: 112
        -- upvalues: toObjMap (copy)
        local v5 = p4[1]
        local v6 = p4[2]

        return {
            name = v5,
            description = v6.description,
            type = v6.type,
            defaultValue = v6.defaultValue,
            deprecationReason = v6.deprecationReason,
            extensions = v6.extensions and toObjMap(v6.extensions),
            astNode = v6.astNode
        }
    end)

    return (setmetatable(t2, t1))
end

function t1.toConfig(p5) -- line: 129
    -- upvalues: argsToArgsConfig (copy)
    return {
        name = p5.name,
        description = p5.description,
        locations = p5.locations,
        args = argsToArgsConfig(p5.args),
        isRepeatable = p5.isRepeatable,
        extensions = p5.extensions,
        astNode = p5.astNode
    }
end

function t1.__tostring(p6) -- line: 141
    return p6:toString()
end

function t1.toString(p7) -- line: 145
    return "@" .. p7.name
end

function t1.toJSON(p8) -- line: 149
    return p8:toString()
end

local v7 = t1.new({
    name = "include",
    description = "Directs the executor to include this field or fragment only when the `if` argument is true.",
    locations = {
        DirectiveLocation.FIELD,
        DirectiveLocation.FRAGMENT_SPREAD,
        DirectiveLocation.INLINE_FRAGMENT
    },
    args = Map.new({
        {
            "if",
            {
                description = "Included when true.",
                type = GraphQLNonNull.new(GraphQLBoolean)
            }
        }
    })
})
local v8 = t1.new({
    name = "skip",
    description = "Directs the executor to skip this field or fragment when the `if` argument is true.",
    locations = {
        DirectiveLocation.FIELD,
        DirectiveLocation.FRAGMENT_SPREAD,
        DirectiveLocation.INLINE_FRAGMENT
    },
    args = Map.new({
        {
            "if",
            {
                description = "Skipped when true.",
                type = GraphQLNonNull.new(GraphQLBoolean)
            }
        }
    })
})
local v9 = t1.new({
    name = "deprecated",
    description = "Marks an element of a GraphQL schema as no longer supported.",
    locations = {
        DirectiveLocation.FIELD_DEFINITION,
        DirectiveLocation.ARGUMENT_DEFINITION,
        DirectiveLocation.INPUT_FIELD_DEFINITION,
        DirectiveLocation.ENUM_VALUE
    },
    args = Map.new({
        {
            "reason",
            {
                description = "Explains why this element was deprecated, usually also including a suggestion for how to access supported similar data. Formatted using the Markdown syntax, as specified by [CommonMark](https://commonmark.org/).",
                defaultValue = "No longer supported",
                type = GraphQLString
            }
        }
    })
})
local v10 = t1.new({
    name = "specifiedBy",
    description = "Exposes a URL that specifies the behaviour of this scalar.",
    locations = { DirectiveLocation.SCALAR },
    args = Map.new({
        {
            "url",
            {
                description = "The URL that specifies the behaviour of this scalar.",
                type = GraphQLNonNull.new(GraphQLString)
            }
        }
    })
})
local v11 = Object.freeze({ v7, v8, v9, v10 })

local function isSpecifiedDirective(p9) -- line: 277
    -- upvalues: Array (copy), v11 (copy)
    return Array.some(v11, function(p10) -- line: 278
        -- upvalues: p9 (copy)
        return p10.name == p9.name
    end)
end

return {
    DEFAULT_DEPRECATION_REASON = "No longer supported",
    isDirective = isDirective,
    assertDirective = assertDirective,
    GraphQLDirective = t1,
    GraphQLIncludeDirective = v7,
    GraphQLSkipDirective = v8,
    GraphQLDeprecatedDirective = v9,
    GraphQLSpecifiedByDirective = v10,
    specifiedDirectives = v11,
    isSpecifiedDirective = isSpecifiedDirective
}
