-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.extendSchema
-- https://lua.expert

local ParentParent = script.Parent.Parent
local ParentParent2 = ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Error, Map, Object = LuauPolyfill.Array, LuauPolyfill.Error, LuauPolyfill.Map, LuauPolyfill.Object
local coerceToMap = LuauPolyfill.coerceToMap
local mapValueOrdered = require(ParentParent.luaUtils.mapValueOrdered).mapValueOrdered

require(ParentParent.luaUtils.null)

local jsutils = ParentParent.jsutils
local keyMap = require(jsutils.keyMap).keyMap
local inspect = require(jsutils.inspect).inspect
local devAssert = require(jsutils.devAssert).devAssert

require(jsutils.ObjMap)
require(ParentParent.language.ast)

local Kind = require(ParentParent.language.kinds).Kind
local predicates = require(ParentParent.language.predicates)
local isTypeDefinitionNode, isTypeExtensionNode = predicates.isTypeDefinitionNode, predicates.isTypeExtensionNode
local assertValidSDLExtension = require(ParentParent.validation.validate).assertValidSDLExtension
local getDirectiveValues = require(ParentParent.execution.values).getDirectiveValues
local type = ParentParent.type
local schema = require(type.schema)
local assertSchema, GraphQLSchema = schema.assertSchema, schema.GraphQLSchema
local scalars = require(type.scalars)
local specifiedScalarTypes, isSpecifiedScalarType = scalars.specifiedScalarTypes, scalars.isSpecifiedScalarType
local introspection = require(type.introspection)
local introspectionTypes, isIntrospectionType = introspection.introspectionTypes, introspection.isIntrospectionType
local directives = require(type.directives)
local GraphQLDirective, GraphQLDeprecatedDirective, GraphQLSpecifiedByDirective = directives.GraphQLDirective, directives.GraphQLDeprecatedDirective, directives.GraphQLSpecifiedByDirective
local definition = require(type.definition)
local isScalarType, isObjectType, isInterfaceType, isUnionType = definition.isScalarType, definition.isObjectType, definition.isInterfaceType, definition.isUnionType
local isListType, isNonNullType, isEnumType, isInputObjectType = definition.isListType, definition.isNonNullType, definition.isEnumType, definition.isInputObjectType
local GraphQLList, GraphQLNonNull, GraphQLScalarType, GraphQLObjectType = definition.GraphQLList, definition.GraphQLNonNull, definition.GraphQLScalarType, definition.GraphQLObjectType
local GraphQLInterfaceType, GraphQLUnionType, GraphQLEnumType, GraphQLInputObjectType = definition.GraphQLInterfaceType, definition.GraphQLUnionType, definition.GraphQLEnumType, definition.GraphQLInputObjectType
local valueFromAST = require(script.Parent.valueFromAST).valueFromAST
local v1, getDeprecationReason, getSpecifiedByUrl

local function extendSchema(p1, p2, p3) -- line: 152
    -- upvalues: devAssert (copy), Kind (copy), assertValidSDLExtension (copy), assertSchema (copy), GraphQLSchema (copy)
    assertSchema(p1)
    devAssert(p2 ~= nil and p2.kind == Kind.DOCUMENT, "Must provide valid Document AST.")

    if (p3 and p3.assumeValid) ~= true and (p3 and p3.assumeValidSDL) ~= true then
        assertValidSDLExtension(p2, p1)
    end

    local v3 = p1:toConfig()
    local v4 = extendSchemaImpl(v3, p2, p3)

    if v3 == v4 then
        return p1
    end

    return (GraphQLSchema.new(v4))
end

function extendSchemaImpl(p4, p5, p6) -- line: 175
    -- upvalues: Array (copy), Error (copy), Map (copy), Object (copy), coerceToMap (copy), mapValueOrdered (copy), inspect (copy), Kind (copy), isTypeDefinitionNode (copy), isTypeExtensionNode (copy), isSpecifiedScalarType (copy), isIntrospectionType (copy), GraphQLDirective (copy), isScalarType (copy), isObjectType (copy), isInterfaceType (copy), isUnionType (copy), isListType (copy), isNonNullType (copy), isEnumType (copy), isInputObjectType (copy), GraphQLList (copy), GraphQLNonNull (copy), GraphQLScalarType (copy), GraphQLObjectType (copy), GraphQLInterfaceType (copy), GraphQLUnionType (copy), GraphQLEnumType (copy), GraphQLInputObjectType (copy), valueFromAST (copy), v1 (ref), getDeprecationReason (ref), getSpecifiedByUrl (ref)
    local t1 = {}
    local v5 = Map.new()
    local t2 = {}
    local t3 = {}
    local v6

    for _, v7 in ipairs(p5.definitions) do
        if v7.kind == Kind.SCHEMA_DEFINITION then
            v6 = v7
        elseif v7.kind == Kind.SCHEMA_EXTENSION then
            table.insert(t3, v7)
        elseif isTypeDefinitionNode(v7) then
            table.insert(t1, v7)
        elseif isTypeExtensionNode(v7) then
            local value = v7.name.value
            local v8 = v5:get(value)

            v5:set(value, if v8 then Array.concat(v8, { v7 }) else { v7 })
        elseif v7.kind == Kind.DIRECTIVE_DEFINITION then
            table.insert(t2, v7)
        end
    end

    if #v5:keys() == 0 and #t1 == 0 and #t2 == 0 and #t3 == 0 and v6 == nil then
        return p4
    end

    local v10 = Map.new()
    local replaceNamedType, extendArg, extendField, extendScalarType, extendObjectType, extendInterfaceType, extendUnionType, extendEnumType, extendInputObjectType, buildInputFieldMap, buildEnumValueMap, buildInterfaces, buildUnionTypes, getNamedType, buildArgumentMap, buildFieldMap, replaceType

    local function replaceType2(p7) -- line: 279
        -- upvalues: replaceNamedType (ref), replaceType (ref), isListType (copy), isNonNullType (copy), GraphQLList (copy), GraphQLNonNull (copy)
        if isListType(p7) then
            return GraphQLList.new(replaceType(p7.ofType))
        end

        if isNonNullType(p7) then
            return GraphQLNonNull.new(replaceType(p7.ofType))
        end

        return replaceNamedType(p7)
    end

    replaceType = replaceType2

    function replaceNamedType(p8) -- line: 291
        -- upvalues: v10 (copy)
        return v10:get(p8.name)
    end

    local function replaceDirective(p9) -- line: 299
        -- upvalues: extendArg (ref), Object (copy), coerceToMap (copy), mapValueOrdered (copy), GraphQLDirective (copy)
        local v11 = p9:toConfig()

        return GraphQLDirective.new(Object.assign({}, v11, {
            args = mapValueOrdered(coerceToMap(v11.args), extendArg)
        }))
    end

    local function extendNamedType(p10) -- line: 310
        -- upvalues: extendScalarType (ref), extendObjectType (ref), extendInterfaceType (ref), extendUnionType (ref), extendEnumType (ref), extendInputObjectType (ref), inspect (copy), isSpecifiedScalarType (copy), isIntrospectionType (copy), isScalarType (copy), isObjectType (copy), isInterfaceType (copy), isUnionType (copy), isEnumType (copy), isInputObjectType (copy)
        if isIntrospectionType(p10) or isSpecifiedScalarType(p10) then
            return p10
        end

        if isScalarType(p10) then
            return extendScalarType(p10)
        end

        if isObjectType(p10) then
            return extendObjectType(p10)
        end

        if isInterfaceType(p10) then
            return extendInterfaceType(p10)
        end

        if isUnionType(p10) then
            return extendUnionType(p10)
        end

        if isEnumType(p10) then
            return extendEnumType(p10)
        end

        if isInputObjectType(p10) then
            return extendInputObjectType(p10)
        end

        assert(false, "Unexpected type: " .. inspect(p10))
    end

    function extendInputObjectType(p11) -- line: 341
        -- upvalues: v5 (copy), buildInputFieldMap (ref), replaceType2 (copy), Array (copy), Map (copy), Object (copy), coerceToMap (copy), mapValueOrdered (copy), GraphQLInputObjectType (copy)
        local v13 = p11:toConfig()
        local v14 = v5[v13.name] or {}

        return GraphQLInputObjectType.new(Object.assign({}, v13, {
            fields = function() -- fields | line: 347
                -- upvalues: v13 (copy), v14 (copy), buildInputFieldMap (ref), replaceType2 (copy), Array (copy), Map (copy), Object (copy), coerceToMap (copy), mapValueOrdered (copy)
                return Map.new(Array.concat(mapValueOrdered(coerceToMap(v13.fields), function(p12) -- line: 349
                    -- upvalues: replaceType2 (copy), Object (copy)
                    return Object.assign({}, p12, {
                        type = replaceType2(p12.type)
                    })
                end):entries(), buildInputFieldMap(v14):entries()))
            end,
            extensionASTNodes = Array.concat(v13.extensionASTNodes, v14)
        }))
    end

    function extendEnumType(p13) -- line: 360
        -- upvalues: v5 (copy), buildEnumValueMap (ref), Array (copy), Map (copy), Object (copy), GraphQLEnumType (copy)
        local v15 = p13:toConfig()
        local v16 = v5:get(p13.name) or {}

        return GraphQLEnumType.new(Object.assign({}, v15, {
            values = Map.new(Array.concat(v15.values:entries(), buildEnumValueMap(v16):entries())),
            extensionASTNodes = Array.concat(v15.extensionASTNodes, v16)
        }))
    end

    function extendScalarType(p14) -- line: 378
        -- upvalues: v5 (copy), Array (copy), Object (copy), GraphQLScalarType (copy), getSpecifiedByUrl (ref)
        local v17 = p14:toConfig()
        local v18 = v5:get(v17.name) or {}
        local v19 = v17.specifiedByUrl

        for _, v20 in ipairs(v18) do
            v19 = getSpecifiedByUrl(v20) or v19
        end

        return GraphQLScalarType.new(Object.assign({}, v17, {
            specifiedByUrl = v19,
            extensionASTNodes = Array.concat(v17.extensionASTNodes, v18)
        }))
    end

    function extendObjectType(p15) -- line: 394
        -- upvalues: v5 (copy), replaceNamedType (ref), extendField (ref), buildInterfaces (ref), buildFieldMap (ref), Array (copy), Map (copy), Object (copy), coerceToMap (copy), mapValueOrdered (copy), GraphQLObjectType (copy)
        local v21 = p15:toConfig()
        local v22 = v5:get(v21.name) or {}

        return GraphQLObjectType.new(Object.assign({}, v21, {
            interfaces = function() -- interfaces | line: 400
                -- upvalues: p15 (copy), v22 (copy), replaceNamedType (ref), buildInterfaces (ref), Array (copy)
                return Array.concat(Array.map(p15:getInterfaces(), replaceNamedType), buildInterfaces(v22))
            end,
            fields = function() -- fields | line: 407
                -- upvalues: v21 (copy), v22 (copy), extendField (ref), buildFieldMap (ref), Array (copy), Map (copy), coerceToMap (copy), mapValueOrdered (copy)
                return Map.new(Array.concat(mapValueOrdered(coerceToMap(v21.fields), extendField):entries(), buildFieldMap(v22):entries()))
            end,
            extensionASTNodes = Array.concat(v21.extensionASTNodes, v22)
        }))
    end

    function extendInterfaceType(p16) -- line: 419
        -- upvalues: v5 (copy), replaceNamedType (ref), extendField (ref), buildInterfaces (ref), buildFieldMap (ref), Array (copy), Map (copy), Object (copy), coerceToMap (copy), mapValueOrdered (copy), GraphQLInterfaceType (copy)
        local v23 = p16:toConfig()
        local v24 = v5:get(v23.name) or {}

        return GraphQLInterfaceType.new(Object.assign({}, v23, {
            interfaces = function() -- interfaces | line: 425
                -- upvalues: p16 (copy), v24 (copy), replaceNamedType (ref), buildInterfaces (ref), Array (copy)
                return Array.concat(Array.map(p16:getInterfaces(), replaceNamedType), buildInterfaces(v24))
            end,
            fields = function() -- fields | line: 432
                -- upvalues: v23 (copy), v24 (copy), extendField (ref), buildFieldMap (ref), Array (copy), Map (copy), coerceToMap (copy), mapValueOrdered (copy)
                return Map.new(Array.concat(mapValueOrdered(coerceToMap(v23.fields), extendField):entries(), buildFieldMap(v24):entries()))
            end,
            extensionASTNodes = Array.concat(v23.extensionASTNodes, v24)
        }))
    end

    function extendUnionType(p17) -- line: 444
        -- upvalues: v5 (copy), replaceNamedType (ref), buildUnionTypes (ref), Array (copy), Object (copy), GraphQLUnionType (copy)
        local v25 = p17:toConfig()
        local v26 = v5:get(v25.name) or {}

        return GraphQLUnionType.new(Object.assign({}, v25, {
            types = function() -- types | line: 450
                -- upvalues: p17 (copy), v26 (copy), replaceNamedType (ref), buildUnionTypes (ref), Array (copy)
                return Array.concat(Array.map(p17:getTypes(), replaceNamedType), buildUnionTypes(v26))
            end,
            extensionASTNodes = Array.concat(v25.extensionASTNodes, v26)
        }))
    end

    function extendField(p18) -- line: 461
        -- upvalues: extendArg (ref), replaceType2 (copy), Object (copy), mapValueOrdered (copy)
        return Object.assign({}, p18, {
            type = replaceType2(p18.type),
            args = if p18.args then mapValueOrdered(p18.args, extendArg) else nil
        })
    end

    function extendArg(p19) -- line: 469
        -- upvalues: replaceType2 (copy), Object (copy)
        return Object.assign({}, p19, {
            type = replaceType2(p19.type)
        })
    end

    local function getOperationTypes(p20) -- line: 473
        -- upvalues: getNamedType (ref)
        local t14 = {}

        for _, v27 in ipairs(p20) do
            local v28 = v27.operationTypes or {}

            for _, v29 in ipairs(v28) do
                t14[v29.operation] = getNamedType(v29.type)
            end
        end

        return t14
    end

    function getNamedType(p21) -- line: 496
        -- upvalues: v10 (copy), Error (copy), v1 (ref)
        local value = p21.name.value
        local v30 = v1[value] or v10[value]

        if v30 == nil then
            error(Error.new(("Unknown type: \"%s\"."):format(value)))
        end

        return v30
    end

    local function getWrappedType(p22) -- line: 508
        -- upvalues: getNamedType (ref), getWrappedType (copy), Kind (copy), GraphQLList (copy), GraphQLNonNull (copy)
        if p22.kind == Kind.LIST_TYPE then
            return GraphQLList.new(getWrappedType(p22.type))
        end

        if p22.kind == Kind.NON_NULL_TYPE then
            return GraphQLNonNull.new(getWrappedType(p22.type))
        end

        return getNamedType(p22)
    end

    local function buildDirective(p23) -- line: 519
        -- upvalues: buildArgumentMap (ref), Array (copy), GraphQLDirective (copy)
        local v31 = Array.map(p23.locations, function(p24) -- line: 520
            return p24.value
        end)

        return GraphQLDirective.new({
            name = p23.name.value,
            description = if p23.description then p23.description.value else nil,
            locations = v31,
            isRepeatable = p23.repeatable,
            args = buildArgumentMap(p23.arguments),
            astNode = p23
        })
    end

    function buildFieldMap(p25) -- line: 537
        -- upvalues: buildArgumentMap (ref), getWrappedType (copy), Map (copy), getDeprecationReason (ref)
        local v32 = Map.new()

        for _, v33 in ipairs(p25) do
            local v34 = if v33.fields then v33.fields else {}

            for _, v35 in ipairs(v34) do
                v32:set(v35.name.value, {
                    type = getWrappedType(v35.type),
                    description = if v35.description then v35.description.value else nil,
                    args = buildArgumentMap(v35.arguments),
                    deprecationReason = getDeprecationReason(v35),
                    astNode = v35
                })
            end
        end

        return v32
    end

    function buildArgumentMap(p26) -- line: 565
        -- upvalues: getWrappedType (copy), Map (copy), valueFromAST (copy), getDeprecationReason (ref)
        p26 = p26 or {}

        local v37 = Map.new()

        for _, v38 in ipairs(p26) do
            local v39 = getWrappedType(v38.type)

            v37:set(v38.name.value, {
                type = v39,
                description = if v38.description then v38.description.value else nil,
                defaultValue = valueFromAST(v38.defaultValue, v39),
                deprecationReason = getDeprecationReason(v38),
                astNode = v38
            })
        end

        return v37
    end

    function buildInputFieldMap(p27) -- line: 589
        -- upvalues: getWrappedType (copy), Map (copy), valueFromAST (copy), getDeprecationReason (ref)
        local v40 = Map.new()

        for _, v41 in ipairs(p27) do
            local v42 = if v41.fields then v41.fields else {}

            for _, v43 in ipairs(v42) do
                local v44 = getWrappedType(v43.type)

                v40:set(v43.name.value, {
                    type = v44,
                    description = if v43.description then v43.description.value else nil,
                    defaultValue = valueFromAST(v43.defaultValue, v44),
                    deprecationReason = getDeprecationReason(v43),
                    astNode = v43
                })
            end
        end

        return v40
    end

    function buildEnumValueMap(p28) -- line: 621
        -- upvalues: Map (copy), getDeprecationReason (ref)
        local v45 = Map.new()

        for _, v46 in ipairs(p28) do
            local v47 = if v46.values then v46.values else {}

            for _, v48 in ipairs(v47) do
                v45:set(v48.name.value, {
                    description = if v48.description then v48.description.value else nil,
                    deprecationReason = getDeprecationReason(v48),
                    astNode = v48
                })
            end
        end

        return v45
    end

    function buildInterfaces(p29) -- line: 644
        -- upvalues: getNamedType (ref)
        local t20 = {}

        for _, v49 in ipairs(p29) do
            if v49.interfaces then
                for _, v50 in ipairs(v49.interfaces) do
                    table.insert(t20, (getNamedType(v50)))
                end
            end
        end

        return t20
    end

    function buildUnionTypes(p30) -- line: 670
        -- upvalues: getNamedType (ref)
        local t21 = {}

        for _, v52 in ipairs(p30) do
            if v52.types then
                for _, v53 in ipairs(v52.types) do
                    table.insert(t21, (getNamedType(v53)))
                end
            end
        end

        return t21
    end

    local function buildType(p31) -- line: 691
        -- upvalues: v5 (copy), buildInputFieldMap (ref), buildEnumValueMap (ref), buildInterfaces (ref), buildUnionTypes (ref), buildFieldMap (ref), Array (copy), inspect (copy), Kind (copy), GraphQLScalarType (copy), GraphQLObjectType (copy), GraphQLInterfaceType (copy), GraphQLUnionType (copy), GraphQLEnumType (copy), GraphQLInputObjectType (copy), getSpecifiedByUrl (ref)
        local value = p31.name.value
        local v55 = v5[value] or {}
        local kind = p31.kind

        if kind == Kind.OBJECT_TYPE_DEFINITION then
            local v56 = Array.concat(p31, v55)

            return GraphQLObjectType.new({
                name = value,
                description = if p31.description then p31.description.value else nil,
                interfaces = function() -- interfaces | line: 704
                    -- upvalues: v56 (copy), buildInterfaces (ref)
                    return buildInterfaces(v56)
                end,
                fields = function() -- fields | line: 707
                    -- upvalues: v56 (copy), buildFieldMap (ref)
                    return buildFieldMap(v56)
                end,
                astNode = p31,
                extensionASTNodes = v55
            })
        end

        if kind == Kind.INTERFACE_TYPE_DEFINITION then
            local v57 = Array.concat(p31, v55)

            return GraphQLInterfaceType.new({
                name = value,
                description = if p31.description then p31.description.value else nil,
                interfaces = function() -- interfaces | line: 724
                    -- upvalues: v57 (copy), buildInterfaces (ref)
                    return buildInterfaces(v57)
                end,
                fields = function() -- fields | line: 727
                    -- upvalues: v57 (copy), buildFieldMap (ref)
                    return buildFieldMap(v57)
                end,
                astNode = p31,
                extensionASTNodes = v55
            })
        end

        if kind == Kind.ENUM_TYPE_DEFINITION then
            local v58 = Array.concat(p31, v55)

            return GraphQLEnumType.new({
                name = value,
                description = if p31.description then p31.description.value else nil,
                values = buildEnumValueMap(v58),
                astNode = p31,
                extensionASTNodes = v55
            })
        end

        if kind == Kind.UNION_TYPE_DEFINITION then
            local v59 = Array.concat(p31, v55)

            return GraphQLUnionType.new({
                name = value,
                description = if p31.description then p31.description.value else nil,
                types = function() -- types | line: 750
                    -- upvalues: v59 (copy), buildUnionTypes (ref)
                    return buildUnionTypes(v59)
                end,
                astNode = p31,
                extensionASTNodes = v55
            })
        end

        if kind == Kind.SCALAR_TYPE_DEFINITION then
            return GraphQLScalarType.new({
                name = value,
                description = if p31.description then p31.description.value else nil,
                specifiedByUrl = getSpecifiedByUrl(p31),
                astNode = p31,
                extensionASTNodes = v55
            })
        end

        if kind == Kind.INPUT_OBJECT_TYPE_DEFINITION then
            local v60 = Array.concat(p31, v55)

            return GraphQLInputObjectType.new({
                name = value,
                description = if p31.description then p31.description.value else nil,
                fields = function() -- fields | line: 773
                    -- upvalues: v60 (copy), buildInputFieldMap (ref)
                    return buildInputFieldMap(v60)
                end,
                astNode = p31,
                extensionASTNodes = v55
            })
        end

        assert(false, "Unexpected type definition node: " .. inspect(p31))
    end

    for _, v62 in ipairs(p4.types) do
        v10:set(v62.name, extendNamedType(v62))
    end

    for _, v63 in ipairs(t1) do
        local value = v63.name.value

        v10:set(value, v1[value] or buildType(v63))
    end

    local v64 = Object.assign({}, {
        query = p4.query and replaceNamedType(p4.query),
        mutation = p4.mutation and replaceNamedType(p4.mutation),
        subscription = p4.subscription and replaceNamedType(p4.subscription)
    }, v6 and getOperationTypes({ v6 }) or {}, (getOperationTypes(t3)))
    local value = if v6 == nil or v6.description == nil then nil else v6.description.value
    local v65 = p6 ~= nil and p6.assumeValid ~= nil and p6.assumeValid
    local v66 = Object.assign({}, {
        description = value
    }, v64, {
        types = v10:values(),
        directives = Array.concat(Array.map(p4.directives, replaceDirective), Array.map(t2, buildDirective)),
        astNode = v6 or p4.astNode,
        extensionASTNodes = Array.concat(p4.extensionASTNodes, t3),
        assumeValid = v65
    })

    v66.extensions = nil

    return v66
end

v1 = keyMap(Array.concat(specifiedScalarTypes, introspectionTypes), function(p32) -- line: 846
    return p32.name
end)

function getDeprecationReason(p33) -- line: 854
    -- upvalues: getDirectiveValues (copy), GraphQLDeprecatedDirective (copy)
    local v67 = getDirectiveValues(GraphQLDeprecatedDirective, p33)

    return v67 and v67.reason
end

function getSpecifiedByUrl(p34) -- line: 864
    -- upvalues: getDirectiveValues (copy), GraphQLSpecifiedByDirective (copy)
    local v68 = getDirectiveValues(GraphQLSpecifiedByDirective, p34)

    return v68 and v68.url
end

return {
    extendSchema = extendSchema,
    extendSchemaImpl = extendSchemaImpl
}
