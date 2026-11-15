-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.graphql
-- https://lua.expert

local Parent = script.Parent
local ParentParent = Parent.Parent
local Error = require(ParentParent.LuauPolyfill).Error
local Promise = require(ParentParent.Promise)

require(Parent.jsutils.PromiseOrValue)

local isPromise = require(Parent.jsutils.isPromise).isPromise

require(Parent.language.source)

local parse = require(Parent.language.parser).parse

require(Parent.type.definition)
require(Parent.type.schema)

local validate = require(Parent.validation.validate).validate
local validateSchema = require(Parent.type.validate).validateSchema
local execute = require(Parent.execution.execute).execute
local graphqlImpl
local t1 = {
    graphql = function(p1) -- line: 93
        -- upvalues: Promise (copy), graphqlImpl (ref)
        return Promise.new(function(p2) -- line: 95
            -- upvalues: p1 (copy), graphqlImpl (ref)
            return p2(graphqlImpl(p1))
        end)
    end,
    graphqlSync = function(p3) -- line: 106
        -- upvalues: Error (copy), isPromise (copy), graphqlImpl (ref)
        local v1 = graphqlImpl(p3)

        if isPromise(v1) then
            error(Error.new("GraphQL execution failed to complete synchronously."))
        end

        return v1
    end
}

function graphqlImpl(p4) -- line: 119
    -- upvalues: parse (copy), validate (copy), validateSchema (copy), execute (copy)
    local schema, source, rootValue, contextValue = p4.schema, p4.source, p4.rootValue, p4.contextValue
    local variableValues, operationName, fieldResolver, typeResolver = p4.variableValues, p4.operationName, p4.fieldResolver, p4.typeResolver
    local v2 = validateSchema(schema)

    if #v2 > 0 then
        return {
            errors = v2
        }
    end

    local v3

    local function v4() -- line: 138
        -- upvalues: source (copy), v3 (ref), parse (copy)
        v3 = parse(source)
    end

    local ok, result = pcall(v4)

    if not ok then
        return {
            errors = { result }
        }
    end

    local v5 = validate(schema, v3)

    if #v5 > 0 then
        return {
            errors = v5
        }
    end

    return execute({
        schema = schema,
        document = v3,
        rootValue = rootValue,
        contextValue = contextValue,
        variableValues = variableValues,
        operationName = operationName,
        fieldResolver = fieldResolver,
        typeResolver = typeResolver
    })
end

return t1
