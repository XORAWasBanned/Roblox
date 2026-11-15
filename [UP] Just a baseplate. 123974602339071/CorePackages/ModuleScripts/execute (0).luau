-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.execution.execute
-- https://lua.expert

local ParentParent = script.Parent.Parent
local jsutils, _error, language, type = ParentParent.jsutils, ParentParent.error, ParentParent.language, ParentParent.type
local utilities, luaUtils, ParentParent2 = ParentParent.utilities, ParentParent.luaUtils, ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Error, Map, Set = LuauPolyfill.Array, LuauPolyfill.Error, LuauPolyfill.Map, LuauPolyfill.Set
local instanceof = LuauPolyfill.instanceof

require(jsutils.ObjMap)
require(jsutils.PromiseOrValue)

local Promise = require(ParentParent.Parent.Promise)
local null = require(luaUtils.null)
local isNillish = require(luaUtils.isNillish).isNillish
local inspect = require(jsutils.inspect).inspect
local memoize3 = require(jsutils.memoize3).memoize3
local invariant = require(jsutils.invariant).invariant
local devAssert = require(jsutils.devAssert).devAssert
local isPromise = require(jsutils.isPromise).isPromise
local isObjectLike = require(jsutils.isObjectLike).isObjectLike
local promiseReduce = require(jsutils.promiseReduce).promiseReduce
local promiseForObject = require(jsutils.promiseForObject).promiseForObject
local Path = require(jsutils.Path)
local addPath, pathToArray = Path.addPath, Path.pathToArray
local isIteratableObject = require(jsutils.isIteratableObject).isIteratableObject

require(_error.formatError)

local GraphQLError = require(_error.GraphQLError).GraphQLError
local locatedError = require(_error.locatedError).locatedError

require(language.ast)

local Kind = require(ParentParent.language.kinds).Kind

require(type.schema)

local definition = require(type.definition)
local assertValidSchema = require(type.validate).assertValidSchema
local introspection = require(type.introspection)
local SchemaMetaFieldDef, TypeMetaFieldDef, TypeNameMetaFieldDef = introspection.SchemaMetaFieldDef, introspection.TypeMetaFieldDef, introspection.TypeNameMetaFieldDef
local directives = require(type.directives)
local GraphQLIncludeDirective, GraphQLSkipDirective = directives.GraphQLIncludeDirective, directives.GraphQLSkipDirective
local isObjectType, isAbstractType, isLeafType, isListType = definition.isObjectType, definition.isAbstractType, definition.isLeafType, definition.isListType
local isNonNullType = definition.isNonNullType
local typeFromAST = require(utilities.typeFromAST).typeFromAST
local getOperationRootType = require(utilities.getOperationRootType).getOperationRootType
local values = require(script.Parent.values)
local getVariableValues, getArgumentValues, getDirectiveValues = values.getVariableValues, values.getArgumentValues, values.getDirectiveValues
local assertValidExecutionArguments, buildExecutionContext, collectFields, buildResolveInfo, v1, v2, getFieldDef, buildResponse, executeOperation, executeFieldsSerially, executeFields, shouldIncludeNode, doesFragmentConditionMatch, getFieldEntryKey, resolveField, handleFieldError, completeValue, completeListValue, completeLeafValue, completeAbstractValue, ensureValidRuntimeType, completeObjectValue, invalidReturnTypeError, collectAndExecuteSubfields, v3

local function execute(p1) -- line: 225
    -- upvalues: Array (copy), assertValidExecutionArguments (ref), buildExecutionContext (ref), buildResponse (ref), executeOperation (ref)
    local schema, document, rootValue, contextValue = p1.schema, p1.document, p1.rootValue, p1.contextValue
    local variableValues, operationName, fieldResolver, typeResolver = p1.variableValues, p1.operationName, p1.fieldResolver, p1.typeResolver

    assertValidExecutionArguments(schema, document, variableValues)

    local v4 = buildExecutionContext(schema, document, rootValue, contextValue, variableValues, operationName, fieldResolver, typeResolver)

    if Array.isArray(v4) or not v4.schema then
        return {
            errors = v4
        }
    end

    local v5 = executeOperation(v4, v4.operation, rootValue)

    return buildResponse(v4, v5)
end

local function executeSync(p2) -- line: 278
    -- upvalues: Error (copy), isPromise (copy), execute (copy)
    local v6 = execute(p2)

    if isPromise(v6) then
        error(Error.new("GraphQL execution failed to complete synchronously."))
    end

    return v6
end

function buildResponse(p3, p4) -- line: 294
    -- upvalues: isPromise (copy), buildResponse (ref)
    if isPromise(p4) then
        return p4:andThen(function(p5) -- line: 301
            -- upvalues: p3 (copy), buildResponse (ref)
            return buildResponse(p3, p5)
        end)
    end

    if #p3.errors == 0 then
        return {
            data = p4
        }
    end

    return {
        errors = p3.errors,
        data = p4
    }
end

function assertValidExecutionArguments(p6, p7, p8) -- line: 320
    -- upvalues: devAssert (copy), isObjectLike (copy), assertValidSchema (copy)
    devAssert(p7, "Must provide document.")
    assertValidSchema(p6)
    devAssert(p8 == nil or isObjectLike(p8), "Variables must be provided as an Object where each property is a variable value. Perhaps look to see if an unparsed JSON string was provided.")
end

function buildExecutionContext(p9, p10, p11, p12, p13, p14, p15, p16) -- line: 345
    -- upvalues: GraphQLError (copy), Kind (copy), getVariableValues (copy), v1 (ref), v2 (ref)
    local t1 = {}
    local v8

    for _, v9 in ipairs(p10.definitions) do
        if v9.kind == Kind.OPERATION_DEFINITION then
            if p14 ~= nil then
                if (v9.name and v9.name.value) == p14 then
                    v8 = v9
                end
            else
                if v8 ~= nil then
                    return { GraphQLError.new("Must provide operation name if query contains multiple operations.") }
                end

                v8 = v9
            end
        elseif v9.kind == Kind.FRAGMENT_DEFINITION then
            t1[v9.name.value] = v9
        end
    end

    if v8 then
        local v11 = getVariableValues(p9, v8.variableDefinitions or {}, p13 or {}, {
            maxErrors = 50
        })

        if v11.errors then
            return v11.errors
        end

        return {
            schema = p9,
            fragments = t1,
            rootValue = p11,
            contextValue = p12,
            operation = v8,
            variableValues = v11.coerced,
            fieldResolver = p15 or v2,
            typeResolver = p16 or v1,
            errors = {}
        }
    end

    if p14 == nil then
        return { GraphQLError.new("Must provide an operation.") }
    end

    return { GraphQLError.new(("Unknown operation named \"%s\"."):format(p14)) }
end

function executeOperation(p17, p18, p19) -- line: 421
    -- upvalues: Map (copy), Promise (copy), null (copy), isPromise (copy), getOperationRootType (copy), collectFields (ref), executeFieldsSerially (ref), executeFields (ref)
    local v12 = getOperationRootType(p17.schema, p18)
    local v13 = collectFields(p17, v12, p18.selectionSet, Map.new(), {})
    local ok, result

    if p18.operation == "mutation" then
        local executeFieldsSerially2 = executeFieldsSerially

        ok, result = pcall(executeFieldsSerially2, p17, v12, p19, nil, v13)
    else
        local executeFields2 = executeFields

        ok, result = pcall(executeFields2, p17, v12, p19, nil, v13)
    end

    if isPromise(result) then
        return result:andThen(nil, function(p20) -- line: 450
            -- upvalues: p17 (copy), Promise (copy), null (copy)
            table.insert(p17.errors, p20)

            return Promise.resolve(null)
        end)
    end

    if ok then
        return result
    end

    table.insert(p17.errors, result)

    return null
end

function executeFieldsSerially(p21, p22, p23, p24, p25) -- line: 467
    -- upvalues: isPromise (copy), promiseReduce (copy), addPath (copy), resolveField (ref)
    return promiseReduce(p25:keys(), function(p26, p27) -- line: 477
        -- upvalues: p21 (copy), p22 (copy), p23 (copy), p24 (copy), p25 (copy), isPromise (copy), addPath (copy), resolveField (ref)
        local v15 = p25[p27]
        local v16 = addPath(p24, p27, p22.name)
        local v17 = resolveField(p21, p22, p23, v15, v16)

        if v17 ~= nil then
            if isPromise(v17) then
                return v17:andThen(function(p28) -- line: 489
                    -- upvalues: p26 (copy), p27 (copy)
                    p26[p27] = p28

                    return p26
                end)
            end

            p26[p27] = v17
        end

        return p26
    end, {})
end

function executeFields(p29, p30, p31, p32, p33) -- line: 508
    -- upvalues: isPromise (copy), promiseForObject (copy), addPath (copy), resolveField (ref)
    local t3 = {}
    local v18 = false

    for _, v19 in ipairs(p33:keys()) do
        local v20 = p33[v19]
        local v21 = addPath(p32, v19, p30.name)
        local v22 = resolveField(p29, p30, p31, v20, v21)

        if v22 ~= nil then
            t3[v19] = v22

            if isPromise(v22) then
                v18 = true
            end
        end
    end

    if v18 then
        return promiseForObject(t3)
    end

    return t3
end

function collectFields(p34, p35, p36, p37, p38) -- line: 555
    -- upvalues: Kind (copy), collectFields (ref), shouldIncludeNode (ref), doesFragmentConditionMatch (ref), getFieldEntryKey (ref)
    for _, v23 in ipairs(p36.selections) do
        if v23.kind == Kind.FIELD then
            if shouldIncludeNode(p34, v23) then
                local v24 = getFieldEntryKey(v23)

                if not p37[v24] then
                    p37[v24] = {}
                end

                table.insert(p37[v24], v23)
            end
        elseif v23.kind == Kind.INLINE_FRAGMENT then
            if shouldIncludeNode(p34, v23) and doesFragmentConditionMatch(p34, v23, p35) then
                collectFields(p34, p35, v23.selectionSet, p37, p38)
            end
        elseif v23.kind == Kind.FRAGMENT_SPREAD then
            local value = v23.name.value

            if not p38[value] and shouldIncludeNode(p34, v23) then
                p38[value] = true

                local v26 = p34.fragments[value]

                if v26 and doesFragmentConditionMatch(p34, v26, p35) then
                    collectFields(p34, p35, v26.selectionSet, p37, p38)
                end
            end
        end
    end

    return p37
end

function shouldIncludeNode(p39, p40) -- line: 616
    -- upvalues: GraphQLIncludeDirective (copy), GraphQLSkipDirective (copy), getDirectiveValues (copy)
    local v27 = getDirectiveValues(GraphQLSkipDirective, p40, p39.variableValues)

    if (v27 and v27["if"]) == true then
        return false
    end

    local v28 = getDirectiveValues(GraphQLIncludeDirective, p40, p39.variableValues)

    return (v28 and v28["if"]) ~= false
end

function doesFragmentConditionMatch(p41, p42, p43) -- line: 638
    -- upvalues: isAbstractType (copy), typeFromAST (copy)
    local typeCondition = p42.typeCondition

    if not typeCondition then
        return true
    end

    local v29 = typeFromAST(p41.schema, typeCondition)

    if v29 == p43 then
        return true
    end

    if isAbstractType(v29) then
        return p41.schema:isSubType(v29, p43)
    end

    return false
end

function getFieldEntryKey(p44) -- line: 670
    if p44.alias then
        return p44.alias.value
    end

    return p44.name.value
end

function resolveField(p45, p46, p47, p48, p49) -- line: 680
    -- upvalues: isPromise (copy), pathToArray (copy), locatedError (copy), getArgumentValues (copy), buildResolveInfo (ref), getFieldDef (ref), handleFieldError (ref), completeValue (ref)
    local value = p48[1].name.value
    local v30 = getFieldDef(p45.schema, p46, value)

    if not v30 then
        return
    end

    local type = v30.type
    local v31 = if v30.resolve then v30.resolve else p45.fieldResolver
    local v32 = buildResolveInfo(p45, v30, p48, p46, p49)

    local function v33() -- line: 711
        -- upvalues: p45 (copy), p47 (copy), p48 (copy), p49 (copy), v30 (copy), type (copy), v32 (copy), v31 (copy), isPromise (copy), pathToArray (copy), locatedError (copy), getArgumentValues (copy), handleFieldError (ref), completeValue (ref)
        local v35 = v31(p47, getArgumentValues(v30, p48[1], p45.variableValues), p45.contextValue, v32)
        local v36 = if isPromise(v35) then v35:andThen(function(p50) -- line: 736
            -- upvalues: p45 (copy), p48 (copy), p49 (copy), type (copy), v32 (copy), completeValue (ref)
            return completeValue(p45, type, p48, v32, p49, p50)
        end) else completeValue(p45, type, p48, v32, p49, v35)

        if isPromise(v36) then
            return v36:andThen(nil, function(p51) -- line: 746
                -- upvalues: p45 (copy), p48 (copy), p49 (copy), type (copy), pathToArray (copy), locatedError (copy), handleFieldError (ref)
                local v37 = locatedError(p51, p48, pathToArray(p49))

                return handleFieldError(v37, type, p45)
            end)
        end

        return v36
    end

    local ok, result = pcall(v33)

    if ok then
        return result
    end

    local v38 = locatedError(result, p48, pathToArray(p49))

    return handleFieldError(v38, type, p45)
end

function buildResolveInfo(p52, p53, p54, p55, p56) -- line: 766
    return {
        fieldName = p53.name,
        fieldNodes = p54,
        returnType = p53.type,
        parentType = p55,
        path = p56,
        schema = p52.schema,
        fragments = p52.fragments,
        rootValue = p52.rootValue,
        operation = p52.operation,
        variableValues = p52.variableValues
    }
end

function handleFieldError(p57, p58, p59) -- line: 789
    -- upvalues: null (copy), isNonNullType (copy)
    if isNonNullType(p58) then
        error(p57)
    end

    table.insert(p59.errors, p57)

    return null
end

function completeValue(p60, p61, p62, p63, p64, p65) -- line: 827
    -- upvalues: Error (copy), instanceof (copy), null (copy), isNillish (copy), inspect (copy), invariant (copy), isObjectType (copy), isAbstractType (copy), isLeafType (copy), isListType (copy), isNonNullType (copy), completeValue (ref), completeListValue (ref), completeLeafValue (ref), completeAbstractValue (ref), completeObjectValue (ref)
    if instanceof(p65, Error) then
        error(p65)
    end

    if isNonNullType(p61) then
        local v39 = completeValue(p60, p61.ofType, p62, p63, p64, p65)

        if isNillish(v39) then
            error(Error.new(("Cannot return null for non-nullable field %s.%s."):format(p63.parentType.name, p63.fieldName)))
        end

        return v39
    end

    if isNillish(p65) then
        return null
    end

    if isListType(p61) then
        return completeListValue(p60, p61, p62, p63, p64, p65)
    end

    if isLeafType(p61) then
        return completeLeafValue(p61, p65)
    end

    if isAbstractType(p61) then
        return completeAbstractValue(p60, p61, p62, p63, p64, p65)
    end

    if isObjectType(p61) then
        return completeObjectValue(p60, p61, p62, p63, p64, p65)
    end

    invariant(false, "Cannot complete value of unexpected output type: " .. inspect(p61))
    assert(false, "Cannot complete value of unexpected output type: " .. inspect(p61))
end

function completeListValue(p66, p67, p68, p69, p70, p71) -- line: 932
    -- upvalues: Array (copy), Set (copy), instanceof (copy), Promise (copy), isPromise (copy), addPath (copy), pathToArray (copy), isIteratableObject (copy), GraphQLError (copy), locatedError (copy), handleFieldError (ref), completeValue (ref)
    local v41 = p71

    if instanceof(p71, Set) then
        v41 = {}

        for _, v42 in p71 do
            table.insert(v41, v42)
        end
    end

    if not isIteratableObject(v41) then
        error(GraphQLError.new(("Expected Iterable, but did not find one for field \"%s.%s\"."):format(p69.parentType.name, p69.fieldName)))
    end

    local ofType = p67.ofType
    local v43 = false
    local v44 = false
    local v45 = Array.from(v41, function(p72, p73) -- line: 967
        -- upvalues: p66 (copy), p68 (copy), p69 (copy), p70 (copy), ofType (copy), v43 (ref), v44 (ref), isPromise (copy), addPath (copy), pathToArray (copy), locatedError (copy), handleFieldError (ref), completeValue (ref)
        local v46 = addPath(p70, p73, nil)

        local function v47() -- line: 972
            -- upvalues: p72 (copy), v46 (copy), p66 (copy), p68 (copy), p69 (copy), ofType (copy), v43 (ref), v44 (ref), isPromise (copy), pathToArray (copy), locatedError (copy), handleFieldError (ref), completeValue (ref)
            local v48 = if isPromise(p72) then p72:andThen(function(p74) -- line: 975
                -- upvalues: v46 (copy), p66 (copy), p68 (copy), p69 (copy), ofType (copy), completeValue (ref)
                return completeValue(p66, ofType, p68, p69, v46, p74)
            end) else completeValue(p66, ofType, p68, p69, v46, p72)

            if isPromise(v48) then
                v43 = true

                return v48:andThen(nil, function(p75) -- line: 993
                    -- upvalues: v46 (copy), p66 (copy), p68 (copy), ofType (copy), pathToArray (copy), locatedError (copy), handleFieldError (ref)
                    local v49 = locatedError(p75, p68, pathToArray(v46))

                    return handleFieldError(v49, ofType, p66)
                end)
            end

            v44 = true

            return v48
        end

        local ok, result = pcall(v47)

        if ok then
            return result
        end

        local v50 = locatedError(result, p68, pathToArray(v46))

        return handleFieldError(v50, ofType, p66)
    end)

    if v44 and v43 then
        v45 = Array.map(v45, function(p76) -- line: 1015
            -- upvalues: Promise (copy), isPromise (copy)
            if isPromise(p76) then
                return p76
            end

            return (Promise.resolve(p76))
        end)
    end

    if v43 then
        v45 = Promise.all(v45)
    end

    return v45
end

function completeLeafValue(p77, p78) -- line: 1028
    -- upvalues: Error (copy), inspect (copy)
    local v51 = p77:serialize(p78)

    if v51 == nil then
        error(Error.new(("Expected a value of type \"%s\" but "):format(inspect(p77)) .. ("received: %s"):format(inspect(p78))))
    end

    return v51
end

function completeAbstractValue(p79, p80, p81, p82, p83, p84) -- line: 1048
    -- upvalues: isPromise (copy), ensureValidRuntimeType (ref), completeObjectValue (ref)
    local v52 = (if p80.resolveType then p80.resolveType else p79.typeResolver)(p84, p79.contextValue, p82, p80)

    if not isPromise(v52) then
        return completeObjectValue(p79, ensureValidRuntimeType(v52, p79, p80, p81, p82, p84), p81, p82, p83, p84)
    end

    return v52:andThen(function(p85) -- line: 1066
        -- upvalues: p79 (copy), p80 (copy), p81 (copy), p82 (copy), p83 (copy), p84 (copy), ensureValidRuntimeType (ref), completeObjectValue (ref)
        return completeObjectValue(p79, ensureValidRuntimeType(p85, p79, p80, p81, p82, p84), p81, p82, p83, p84)
    end)
end

function ensureValidRuntimeType(p86, p87, p88, p89, p90, p91) -- line: 1103
    -- upvalues: inspect (copy), GraphQLError (copy), isObjectType (copy)
    if p86 == nil then
        error(GraphQLError.new(("Abstract type \"%s\" must resolve to an Object type at runtime for field \"%s.%s\". Either the \"%s\" type should provide a \"resolveType\" function or each possible type should provide an \"isTypeOf\" function."):format(p88.name, p90.parentType.name, p90.fieldName, p88.name), p89))
    end

    if isObjectType(p86) then
        error(GraphQLError.new("Support for returning GraphQLObjectType from resolveType was removed in graphql-js@16.0.0 please return type name instead."))
    end

    if typeof(p86) ~= "string" then
        error(GraphQLError.new(("Abstract type \"%s\" must resolve to an Object type at runtime for field \"%s.%s\" with "):format(p88.name, p90.parentType.name, p90.fieldName) .. ("value %s, received \"%s\"."):format(inspect(p91), inspect(p86))))
    end

    local v53 = p87.schema:getType(p86)

    if v53 == nil then
        error(GraphQLError.new(("Abstract type \"%s\" was resolve to a type \"%s\" that does not exist inside schema."):format(p88.name, p86), p89))
    end

    if not isObjectType(v53) then
        error(GraphQLError.new(("Abstract type \"%s\" was resolve to a non-object type \"%s\"."):format(p88.name, p86), p89))
    end

    if not p87.schema:isSubType(p88, v53) then
        error(GraphQLError.new(("Runtime Object type \"%s\" is not a possible type for \"%s\"."):format(v53.name, p88.name), p89))
    end

    return v53
end

function completeObjectValue(p92, p93, p94, p95, p96, p97) -- line: 1190
    -- upvalues: isPromise (copy), invalidReturnTypeError (ref), collectAndExecuteSubfields (ref)
    if p93.isTypeOf == nil then
        return collectAndExecuteSubfields(p92, p93, p94, p96, p97)
    end

    local v54 = p93.isTypeOf(p93, p97, p92.contextValue, p95)

    if isPromise(v54) then
        return v54:andThen(function(p98) -- line: 1206
            -- upvalues: p92 (copy), p93 (copy), p94 (copy), p96 (copy), p97 (copy), invalidReturnTypeError (ref), collectAndExecuteSubfields (ref)
            if not p98 then
                error(invalidReturnTypeError(p93, p97, p94))
            end

            return collectAndExecuteSubfields(p92, p93, p94, p96, p97)
        end)
    end

    if not v54 then
        error(invalidReturnTypeError(p93, p97, p94))
    end

    return collectAndExecuteSubfields(p92, p93, p94, p96, p97)
end

function invalidReturnTypeError(p99, p100, p101) -- line: 1223
    -- upvalues: inspect (copy), GraphQLError (copy)
    return GraphQLError.new(("Expected value of type \"%s\" but got: %s."):format(p99.name, inspect(p100)), p101)
end

function collectAndExecuteSubfields(p102, p103, p104, p105, p106) -- line: 1234
    -- upvalues: executeFields (ref), v3 (ref)
    local v55 = v3(p102, p103, p104)

    return executeFields(p102, p103, p106, p105, v55)
end

v3 = memoize3(function(p107, p108, p109) -- _collectSubfields | line: 1250
    -- upvalues: Map (copy), collectFields (ref)
    local t4 = {}
    local v56 = Map.new()

    for _, v57 in ipairs(p109) do
        if v57.selectionSet then
            v56 = collectFields(p107, p108, v57.selectionSet, v56, t4)
        end
    end

    return v56
end)

v1 = function(p110, p111, p112, p113) -- line: 1290
    -- upvalues: Promise (copy), isPromise (copy), isObjectLike (copy)
    local v58 = isObjectLike(p110)
    local v59 = if v58 then typeof(p110.__typename) == "string" else nil

    if v58 and v59 then
        return p110.__typename
    end

    local v60 = p112.schema:getPossibleTypes(p113)
    local t5 = {}

    for i = 1, #v60 do
        local v61 = v60[i]

        if v61.isTypeOf then
            local v62 = v61:isTypeOf(p110, p111, p112)

            if isPromise(v62) then
                t5[i] = v62
            elseif v62 then
                return v61.name
            end
        end
    end

    if not (#t5 > 0) then
        return nil
    end

    return Promise.all(t5):andThen(function(p114) -- line: 1315
        -- upvalues: v60 (copy)
        for i = 1, #p114 do
            if p114[i] then
                return v60[i].name
            end
        end

        return nil
    end)
end

v2 = function(p115, p116, p117, p118) -- line: 1334
    -- upvalues: isObjectLike (copy)
    if not isObjectLike(p115) and typeof(p115) ~= "function" then
        return nil
    end

    local v63 = p115[p118.fieldName]

    if typeof(v63) == "function" then
        return p115[p118.fieldName](p115, p116, p117, p118)
    end

    return v63
end

function getFieldDef(p119, p120, p121) -- line: 1358
    -- upvalues: SchemaMetaFieldDef (copy), TypeMetaFieldDef (copy), TypeNameMetaFieldDef (copy)
    if p121 == SchemaMetaFieldDef.name and p119:getQueryType() == p120 then
        return SchemaMetaFieldDef
    end

    if p121 == TypeMetaFieldDef.name and p119:getQueryType() == p120 then
        return TypeMetaFieldDef
    end

    if p121 == TypeNameMetaFieldDef.name then
        return TypeNameMetaFieldDef
    end

    return p120:getFields():get(p121)
end

return {
    execute = execute,
    executeSync = executeSync,
    assertValidExecutionArguments = assertValidExecutionArguments,
    buildExecutionContext = buildExecutionContext,
    collectFields = collectFields,
    buildResolveInfo = buildResolveInfo,
    getFieldDef = getFieldDef,
    defaultFieldResolver = v2,
    defaultTypeResolver = v1
}
