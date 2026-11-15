-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.type.definition
-- https://lua.expert

local ParentParent = script.Parent.Parent
local ParentParent2 = ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Error, Map, Object = LuauPolyfill.Array, LuauPolyfill.Error, LuauPolyfill.Map, LuauPolyfill.Object
local coerceToMap = LuauPolyfill.coerceToMap
local null = require(ParentParent.luaUtils.null)
local v1 = Object.freeze({})
local luaUtils = ParentParent.luaUtils
local isNillish = require(luaUtils.isNillish).isNillish
local jsutils = ParentParent.jsutils

require(jsutils.ObjMap)

local inspect = require(jsutils.inspect).inspect
local keyMap = require(jsutils.keyMap).keyMap
local toObjMap = require(jsutils.toObjMap).toObjMap
local keyValMap = require(jsutils.keyValMap).keyValMap
local devAssert = require(jsutils.devAssert).devAssert
local instanceOf = require(jsutils.instanceOf)
local didYouMean = require(jsutils.didYouMean).didYouMean
local isObjectLike = require(jsutils.isObjectLike).isObjectLike
local identityFunc = require(jsutils.identityFunc).identityFunc
local suggestionList = require(jsutils.suggestionList).suggestionList

require(jsutils.PromiseOrValue)
require(jsutils.Path)

local mapValueOrdered = require(ParentParent.luaUtils.mapValueOrdered).mapValueOrdered
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local language = ParentParent.language
local Kind = require(language.kinds).Kind
local print = require(language.printer).print

require(ParentParent.language.ast)

local valueFromASTUntyped = require(ParentParent.utilities.valueFromASTUntyped).valueFromASTUntyped
local isScalarType, isObjectType, isInterfaceType, isUnionType, isEnumType, isInputObjectType, isListType, isNonNullType, isWrappingType, isNullableType, argsToArgsConfig, defineInputFieldMap, defineTypes, isPlainObj, didYouMeanEnumValue, defineEnumValues, fieldsToFieldsConfig, defineInterfaces, defineFieldMap, t1, t2
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}
local t7 = {}
local t8 = {}

local function isType(p1) -- line: 167
    -- upvalues: isScalarType (ref), isObjectType (ref), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), isInputObjectType (ref), isListType (ref), isNonNullType (ref)
    return isScalarType(p1)
        or isObjectType(p1)
        or isInterfaceType(p1)
        or isUnionType(p1)
        or isEnumType(p1)
        or isInputObjectType(p1)
        or isListType(p1)
        or isNonNullType(p1)
end

local function assertType(p2) -- line: 178
    -- upvalues: Error (copy), inspect (copy), isType (copy)
    if not isType(p2) then
        error(Error.new(("Expected %s to be a GraphQL type."):format(inspect(p2))))
    end

    return p2
end

function isScalarType(p3) -- line: 190
    -- upvalues: instanceOf (copy), t3 (copy)
    return instanceOf(p3, t3)
end

local function assertScalarType(p4) -- line: 194
    -- upvalues: Error (copy), inspect (copy), isScalarType (ref)
    if not isScalarType(p4) then
        error(Error.new(("Expected %s to be a GraphQL Scalar type."):format(inspect(p4))))
    end

    return p4
end

function isObjectType(p5) -- line: 202
    -- upvalues: instanceOf (copy), t4 (copy)
    return instanceOf(p5, t4)
end

local function assertObjectType(p6) -- line: 206
    -- upvalues: Error (copy), inspect (copy), isObjectType (ref)
    if not isObjectType(p6) then
        error(Error.new(("Expected %s to be a GraphQL Object type."):format(inspect(p6))))
    end

    return p6
end

function isInterfaceType(p7) -- line: 214
    -- upvalues: instanceOf (copy), t5 (copy)
    return instanceOf(p7, t5)
end

local function assertInterfaceType(p8) -- line: 218
    -- upvalues: Error (copy), inspect (copy), isInterfaceType (ref)
    if not isInterfaceType(p8) then
        error(Error.new(("Expected %s to be a GraphQL Interface type."):format(inspect(p8))))
    end

    return p8
end

function isUnionType(p9) -- line: 226
    -- upvalues: instanceOf (copy), t6 (copy)
    return instanceOf(p9, t6)
end

local function assertUnionType(p10) -- line: 230
    -- upvalues: Error (copy), inspect (copy), isUnionType (ref)
    if not isUnionType(p10) then
        error(Error.new(("Expected %s to be a GraphQL Union type."):format(inspect(p10))))
    end

    return p10
end

function isEnumType(p11) -- line: 238
    -- upvalues: instanceOf (copy), t7 (copy)
    return instanceOf(p11, t7)
end

local function assertEnumType(p12) -- line: 242
    -- upvalues: Error (copy), inspect (copy), isEnumType (ref)
    if not isEnumType(p12) then
        error(Error.new(("Expected %s to be a GraphQL Enum type."):format(inspect(p12))))
    end

    return p12
end

function isInputObjectType(p13) -- line: 250
    -- upvalues: instanceOf (copy), t8 (copy)
    return instanceOf(p13, t8)
end

local function assertInputObjectType(p14) -- line: 254
    -- upvalues: Error (copy), inspect (copy), isInputObjectType (ref)
    if not isInputObjectType(p14) then
        error(Error.new(("Expected %s to be a GraphQL Input Object type."):format(inspect(p14))))
    end

    return p14
end

function isListType(p15) -- line: 262
    -- upvalues: instanceOf (copy), t1 (ref)
    return instanceOf(p15, t1)
end

local function assertListType(p16) -- line: 266
    -- upvalues: Error (copy), inspect (copy), isListType (ref)
    if not isListType(p16) then
        error(Error.new(("Expected %s to be a GraphQL List type."):format(inspect(p16))))
    end

    return p16
end

function isNonNullType(p17) -- line: 274
    -- upvalues: instanceOf (copy), t2 (ref)
    return instanceOf(p17, t2)
end

local function assertNonNullType(p18) -- line: 278
    -- upvalues: Error (copy), inspect (copy), isNonNullType (ref)
    if not isNonNullType(p18) then
        error(Error.new(("Expected %s to be a GraphQL Non-Null type."):format(inspect(p18))))
    end

    return p18
end

local isInputType

function isInputType(p19) -- line: 324
    -- upvalues: isInputType (ref), isScalarType (ref), isEnumType (ref), isInputObjectType (ref), isWrappingType (ref)
    return isScalarType(p19) or isEnumType(p19) or isInputObjectType(p19) or isWrappingType(p19) and isInputType(p19.ofType)
end

local function assertInputType(p20) -- line: 331
    -- upvalues: isInputType (ref), Error (copy), inspect (copy)
    if not isInputType(p20) then
        error(Error.new(("Expected %s to be a GraphQL input type."):format(inspect(p20))))
    end

    return p20
end

local isOutputType

function isOutputType(p21) -- line: 358
    -- upvalues: isOutputType (ref), isScalarType (ref), isObjectType (ref), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), isWrappingType (ref)
    return isScalarType(p21)
        or isObjectType(p21)
        or isInterfaceType(p21)
        or isUnionType(p21)
        or isEnumType(p21)
        or isWrappingType(p21) and isOutputType(p21.ofType)
end

local function assertOutputType(p22) -- line: 367
    -- upvalues: isOutputType (ref), Error (copy), inspect (copy)
    if not isOutputType(p22) then
        error(Error.new(("Expected %s to be a GraphQL output type."):format(inspect(p22))))
    end

    return p22
end

local function isLeafType(p23) -- line: 380
    -- upvalues: isScalarType (ref), isEnumType (ref)
    return isScalarType(p23) or isEnumType(p23)
end

local function assertLeafType(p24) -- line: 384
    -- upvalues: Error (copy), inspect (copy), isLeafType (copy)
    if not isLeafType(p24) then
        error(Error.new(("Expected %s to be a GraphQL leaf type."):format(inspect(p24))))
    end

    return p24
end

local function isCompositeType(p25) -- line: 397
    -- upvalues: isObjectType (ref), isInterfaceType (ref), isUnionType (ref)
    return isObjectType(p25) or isInterfaceType(p25) or isUnionType(p25)
end

local function assertCompositeType(p26) -- line: 401
    -- upvalues: Error (copy), inspect (copy), isCompositeType (copy)
    if not isCompositeType(p26) then
        error(Error.new(("Expected %s to be a GraphQL composite type."):format(inspect(p26))))
    end

    return p26
end

local function isAbstractType(p27) -- line: 414
    -- upvalues: isInterfaceType (ref), isUnionType (ref)
    return isInterfaceType(p27) or isUnionType(p27)
end

local function assertAbstractType(p28) -- line: 418
    -- upvalues: Error (copy), inspect (copy), isAbstractType (copy)
    if not isAbstractType(p28) then
        error(Error.new(("Expected %s to be a GraphQL abstract type."):format(inspect(p28))))
    end

    return p28
end

t1 = {}
t1.__index = t1

function t1.new(p29) -- line: 452
    -- upvalues: inspect (copy), devAssert (copy), t1 (ref), isType (copy)
    local t9 = {}

    devAssert(isType(p29), ("Expected %s to be a GraphQL type."):format(inspect(p29)))
    t9.ofType = p29

    return (setmetatable(t9, t1))
end

function t1.__tostring(p30) -- line: 462
    return p30:toString()
end

function t1.toString(p31) -- line: 466
    return "[" .. tostring(p31.ofType) .. "]"
end

function t1.toJSON(p32) -- line: 470
    return p32:toString()
end

t2 = {}
t2.__index = t2

function t2.new(p33) -- line: 509
    -- upvalues: inspect (copy), devAssert (copy), isNullableType (ref), t2 (ref)
    local t11 = {}

    devAssert(isNullableType(p33), ("Expected %s to be a GraphQL nullable type."):format(inspect(p33)))
    t11.ofType = p33

    return (setmetatable(t11, t2))
end

function t2.__tostring(p34) -- line: 520
    return p34:toString()
end

function t2.toString(p35) -- line: 524
    return tostring(p35.ofType) .. "!"
end

function t2.toJSON(p36) -- line: 528
    return p36:toString()
end

function isWrappingType(p37) -- line: 545
    -- upvalues: isListType (ref), isNonNullType (ref)
    return isListType(p37) or isNonNullType(p37)
end

local function assertWrappingType(p38) -- line: 549
    -- upvalues: Error (copy), inspect (copy), isWrappingType (ref)
    if not isWrappingType(p38) then
        error(Error.new(("Expected %s to be a GraphQL wrapping type."):format(inspect(p38))))
    end

    return p38
end

function isNullableType(p39) -- line: 569
    -- upvalues: isNonNullType (ref), isType (copy)
    return isType(p39) and not isNonNullType(p39)
end

local function assertNullableType(p40) -- line: 573
    -- upvalues: Error (copy), inspect (copy), isNullableType (ref)
    if not isNullableType(p40) then
        error(Error.new(("Expected %s to be a GraphQL nullable type."):format(inspect(p40))))
    end

    return p40
end

local function getNullableType(p41) -- line: 581
    -- upvalues: isNonNullType (ref)
    if not p41 then
        return nil
    end

    if isNonNullType(p41) then
        return p41.ofType
    end

    return p41
end

local function isNamedType(p42) -- line: 604
    -- upvalues: isScalarType (ref), isObjectType (ref), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), isInputObjectType (ref)
    return isScalarType(p42)
        or isObjectType(p42)
        or isInterfaceType(p42)
        or isUnionType(p42)
        or isEnumType(p42)
        or isInputObjectType(p42)
end

local function assertNamedType(p43) -- line: 613
    -- upvalues: Error (copy), inspect (copy), isNamedType (copy)
    if not isNamedType(p43) then
        error(Error.new(("Expected %s to be a GraphQL named type."):format(inspect(p43))))
    end

    return p43
end

local function getNamedType(p44) -- line: 621
    -- upvalues: isWrappingType (ref)
    if not p44 then
        return nil
    end

    local v2 = p44

    while isWrappingType(v2) do
        v2 = v2.ofType
    end

    return v2
end

local function resolveThunk(p45) -- line: 643
    if typeof(p45) == "function" then
        return (p45())
    end

    return p45
end

local function undefineIfEmpty(p46) -- line: 647
    return if p46 and #p46 > 0 then p46 else nil
end

t3.__index = t3

function t3.new(p47) -- line: 702
    -- upvalues: isNillish (copy), inspect (copy), toObjMap (copy), devAssert (copy), identityFunc (copy), valueFromASTUntyped (copy), t3 (copy)
    local v3 = if p47.parseValue then p47.parseValue else identityFunc
    local t13 = {
        name = p47.name,
        description = p47.description,
        specifiedByUrl = p47.specifiedByUrl
    }
    local v4 = if p47.serialize then p47.serialize else identityFunc

    t13.serialize = function(_, ...) -- line: 716
        -- upvalues: v4 (copy)
        return v4(...)
    end

    t13.parseValue = function(_, ...) -- line: 720
        -- upvalues: v3 (copy)
        return v3(...)
    end

    local v5

    if p47.parseLiteral then
        v5 = p47.parseLiteral
    else
        v5 = function(p50, p51) -- line: 725
            -- upvalues: v3 (copy), valueFromASTUntyped (copy)
            return v3(valueFromASTUntyped(p50, p51))
        end
    end

    t13.parseLiteral = function(_, ...) -- line: 729
        -- upvalues: v5 (ref)
        return v5(...)
    end

    t13.extensions = if p47.extensions then toObjMap(p47.extensions) else nil
    t13.astNode = p47.astNode

    local extensionASTNodes = p47.extensionASTNodes

    t13.extensionASTNodes = if not (extensionASTNodes and #extensionASTNodes > 0) then nil else extensionASTNodes
    devAssert(typeof(p47.name) == "string", "Must provide name.")

    local v6 = isNillish(p47.specifiedByUrl)

    if not v6 then
        v6 = typeof(p47.specifiedByUrl) == "string"
    end

    devAssert(v6, ("%s must provide \"specifiedByUrl\" as a string, "):format(t13.name) .. ("but got: %s."):format(inspect(p47.specifiedByUrl)))
    devAssert(p47.serialize == nil or typeof(p47.serialize) == "function", ("%s must provide \"serialize\" function. If this custom Scalar is also used as an input type, ensure \"parseValue\" and \"parseLiteral\" functions are also provided."):format(t13.name))

    if p47.parseLiteral then
        devAssert(typeof(p47.parseValue) == "function" and typeof(p47.parseLiteral) == "function", ("%s must provide both \"parseValue\" and \"parseLiteral\" functions."):format(t13.name))
    end

    return (setmetatable(t13, t3))
end

function t3.toConfig(p53) -- line: 761
    return {
        name = p53.name,
        description = p53.description,
        specifiedByUrl = p53.specifiedByUrl,
        serialize = p53.serialize,
        parseValue = p53.parseValue,
        parseLiteral = p53.parseLiteral,
        extensions = p53.extensions,
        astNode = p53.astNode,
        extensionASTNodes = if p53.extensionASTNodes then p53.extensionASTNodes else {}
    }
end

function t3.__tostring(p54) -- line: 775
    return p54:toString()
end

function t3.toString(p55) -- line: 779
    return p55.name
end

function t3.toJSON(p56) -- line: 783
    return p56:toString()
end

t4.__index = t4

function t4.new(p57) -- line: 917
    -- upvalues: inspect (copy), toObjMap (copy), devAssert (copy), defineInterfaces (ref), defineFieldMap (ref), t4 (copy)
    local t15 = {
        name = p57.name,
        description = p57.description,
        isTypeOf = p57.isTypeOf,
        extensions = if p57.extensions then toObjMap(p57.extensions) else nil,
        astNode = p57.astNode
    }
    local extensionASTNodes = p57.extensionASTNodes

    t15.extensionASTNodes = if not (extensionASTNodes and #extensionASTNodes > 0) then nil else extensionASTNodes

    t15._fields = function() -- line: 928
        -- upvalues: p57 (copy), defineFieldMap (ref)
        return defineFieldMap(p57)
    end

    t15._interfaces = function() -- line: 931
        -- upvalues: p57 (copy), defineInterfaces (ref)
        return defineInterfaces(p57)
    end

    devAssert(typeof(p57.name) == "string", "Must provide name.")
    devAssert(p57.isTypeOf == nil or typeof(p57.isTypeOf) == "function", ("%s must provide \"isTypeOf\" as a function, but got: %s."):format(t15.name, inspect(p57.isTypeOf)))

    return (setmetatable(t15, t4))
end

function t4.getFields(p58) -- line: 946
    if typeof(p58._fields) == "function" then
        p58._fields = p58._fields()
    end

    return p58._fields
end

function t4.getInterfaces(p59) -- line: 953
    if typeof(p59._interfaces) == "function" then
        p59._interfaces = p59._interfaces()
    end

    return p59._interfaces
end

function t4.toConfig(p60) -- line: 960
    -- upvalues: fieldsToFieldsConfig (ref)
    return {
        name = p60.name,
        description = p60.description,
        interfaces = p60:getInterfaces(),
        fields = fieldsToFieldsConfig(p60:getFields()),
        isTypeOf = p60.isTypeOf,
        extensions = p60.extensions,
        astNode = p60.astNode,
        extensionASTNodes = p60.extensionASTNodes or {}
    }
end

function t4.__tostring(p61) -- line: 973
    return p61:toString()
end

function t4.toString(p62) -- line: 977
    return p62.name
end

function t4.toJSON(p63) -- line: 981
    return p63:toString()
end

function defineInterfaces(p64) -- line: 992
    -- upvalues: Array (copy), devAssert (copy)
    local interfaces = p64.interfaces

    if typeof(interfaces) == "function" then
        interfaces = interfaces()
    end

    local v10 = interfaces or {}

    devAssert(Array.isArray(v10), ("%s interfaces must be an Array or a function which returns an Array."):format(p64.name))

    return v10
end

function defineFieldMap(p65) -- line: 1006
    -- upvalues: Array (copy), Map (copy), coerceToMap (copy), inspect (copy), toObjMap (copy), devAssert (copy), instanceOf (copy), mapValueOrdered (copy), isPlainObj (ref)
    local fields = p65.fields

    if typeof(fields) == "function" then
        fields = fields()
    end

    devAssert(isPlainObj(fields) or instanceOf(fields, Map), ("%s fields must be an object with field names as keys or a function which returns such an object."):format(p65.name))

    return mapValueOrdered(coerceToMap(fields), function(p66, p67) -- line: 1022
        -- upvalues: p65 (copy), Array (copy), Map (copy), coerceToMap (copy), inspect (copy), toObjMap (copy), devAssert (copy), instanceOf (copy), isPlainObj (ref)
        devAssert(isPlainObj(p66), ("%s.%s field config must be an object."):format(p65.name, p67))
        devAssert(p66.resolve == nil or typeof(p66.resolve) == "function", ("%s.%s field resolver must be a function if "):format(p65.name, p67) .. ("provided, but got: %s."):format(inspect(p66.resolve)))

        local v13 = if p66.args then p66.args else {}

        devAssert(isPlainObj(v13) or instanceOf(v13, Map), ("%s.%s args must be an object with argument names as keys."):format(p65.name, p67))

        local v14 = Array.map(coerceToMap(v13):entries(), function(p68) -- line: 1043
            -- upvalues: toObjMap (copy)
            local v15 = p68[1]
            local v16 = p68[2]

            return {
                name = v15,
                description = v16.description,
                type = v16.type,
                defaultValue = v16.defaultValue,
                deprecationReason = v16.deprecationReason,
                extensions = if v16.extensions then toObjMap(v16.extensions) else nil,
                astNode = v16.astNode
            }
        end)

        return {
            name = p67,
            description = p66.description,
            type = p66.type,
            args = v14,
            resolve = p66.resolve,
            subscribe = p66.subscribe,
            deprecationReason = p66.deprecationReason,
            extensions = if p66.extensions then toObjMap(p66.extensions) else nil,
            astNode = p66.astNode
        }
    end)
end

function isPlainObj(p69) -- line: 1071
    -- upvalues: Array (copy), null (copy), isObjectLike (copy)
    if p69 == null then
        return false
    end

    return isObjectLike(p69) and (not Array.isArray(p69) or next(p69) == nil)
end

function fieldsToFieldsConfig(p70) -- line: 1080
    -- upvalues: mapValueOrdered (copy), argsToArgsConfig (ref)
    return mapValueOrdered(p70, function(p71) -- line: 1084
        -- upvalues: argsToArgsConfig (ref)
        return {
            description = p71.description,
            type = p71.type,
            args = argsToArgsConfig(p71.args),
            resolve = p71.resolve,
            subscribe = p71.subscribe,
            deprecationReason = p71.deprecationReason,
            extensions = p71.extensions,
            astNode = p71.astNode
        }
    end)
end

function argsToArgsConfig(p72) -- line: 1101
    -- upvalues: keyValMap (copy)
    return keyValMap(p72, function(p73) -- line: 1102
        return p73.name
    end, function(p74) -- line: 1104
        return {
            description = p74.description,
            type = p74.type,
            defaultValue = p74.defaultValue,
            deprecationReason = p74.deprecationReason,
            extensions = p74.extensions,
            astNode = p74.astNode
        }
    end)
end

local function isRequiredArgument(p75) -- line: 1228
    -- upvalues: isNonNullType (ref)
    return isNonNullType(p75.type) and p75.defaultValue == nil
end

t5.__index = t5

function t5.new(p76) -- line: 1277
    -- upvalues: inspect (copy), toObjMap (copy), devAssert (copy), defineInterfaces (ref), defineFieldMap (ref), t5 (copy)
    local t19 = {
        name = p76.name,
        description = p76.description,
        resolveType = p76.resolveType,
        extensions = if p76.extensions then toObjMap(p76.extensions) else nil,
        astNode = p76.astNode
    }
    local extensionASTNodes = p76.extensionASTNodes

    t19.extensionASTNodes = if not (extensionASTNodes and #extensionASTNodes > 0) then nil else extensionASTNodes

    t19._fields = function() -- line: 1288
        -- upvalues: p76 (copy), defineFieldMap (ref)
        return defineFieldMap(p76)
    end

    t19._interfaces = function() -- line: 1291
        -- upvalues: p76 (copy), defineInterfaces (ref)
        return defineInterfaces(p76)
    end

    devAssert(typeof(p76.name) == "string", "Must provide name.")
    devAssert(p76.resolveType == nil or typeof(p76.resolveType) == "function", ("%s must provide \"resolveType\" as a function, but got: %s."):format(t19.name, inspect(p76.resolveType)))

    return (setmetatable(t19, t5))
end

function t5.getFields(p77) -- line: 1306
    if typeof(p77._fields) == "function" then
        p77._fields = p77._fields()
    end

    return p77._fields
end

function t5.getInterfaces(p78) -- line: 1313
    if typeof(p78._interfaces) == "function" then
        p78._interfaces = p78._interfaces()
    end

    return p78._interfaces
end

function t5.toConfig(p79) -- line: 1320
    -- upvalues: fieldsToFieldsConfig (ref)
    return {
        name = p79.name,
        description = p79.description,
        interfaces = p79:getInterfaces(),
        fields = fieldsToFieldsConfig(p79:getFields()),
        resolveType = p79.resolveType,
        extensions = p79.extensions,
        astNode = p79.astNode,
        extensionASTNodes = p79.extensionASTNodes or {}
    }
end

function t5.__tostring(p80) -- line: 1333
    return p80:toString()
end

function t5.toString(p81) -- line: 1337
    return p81.name
end

function t5.toJSON(p82) -- line: 1341
    return p82:toString()
end

t6.__index = t6

function t6.new(p83) -- line: 1452
    -- upvalues: inspect (copy), toObjMap (copy), devAssert (copy), defineTypes (ref), t6 (copy)
    local t21 = {
        name = p83.name,
        description = p83.description,
        resolveType = p83.resolveType,
        extensions = if p83.extensions then toObjMap(p83.extensions) else nil,
        astNode = p83.astNode
    }
    local extensionASTNodes = p83.extensionASTNodes

    t21.extensionASTNodes = if not (extensionASTNodes and #extensionASTNodes > 0) then nil else extensionASTNodes

    t21._types = function() -- line: 1461
        -- upvalues: p83 (copy), defineTypes (ref)
        return defineTypes(p83)
    end

    devAssert(typeof(p83.name) == "string", "Must provide name.")
    devAssert(p83.resolveType == nil or typeof(p83.resolveType) == "function", ("%s must provide \"resolveType\" as a function, but got: %s."):format(t21.name, inspect(p83.resolveType)))

    return (setmetatable(t21, t6))
end

function t6.getTypes(p84) -- line: 1476
    if typeof(p84._types) == "function" then
        p84._types = p84._types()
    end

    return p84._types
end

function t6.toConfig(p85) -- line: 1483
    return {
        name = p85.name,
        description = p85.description,
        types = p85:getTypes(),
        resolveType = p85.resolveType,
        extensions = p85.extensions,
        astNode = p85.astNode,
        extensionASTNodes = p85.extensionASTNodes or {}
    }
end

function t6.__tostring(p86) -- line: 1495
    return p86:toString()
end

function t6.toString(p87) -- line: 1499
    return p87.name
end

function t6.toJSON(p88) -- line: 1503
    return p88:toString()
end

function defineTypes(p89) -- line: 1514
    -- upvalues: Array (copy), devAssert (copy)
    local types = p89.types

    if typeof(types) == "function" then
        types = types()
    end

    devAssert(Array.isArray(types), ("Must provide Array of types or a function which returns such an array for Union %s."):format(p89.name))

    return types
end

t7.__index = t7

function t7.new(p90) -- line: 1601
    -- upvalues: Array (copy), v1 (copy), keyMap (copy), toObjMap (copy), devAssert (copy), defineEnumValues (ref), t7 (copy)
    local t23 = {
        name = p90.name,
        description = p90.description
    }

    t23.extensions = if p90.extensions then toObjMap(p90.extensions) else nil
    t23.astNode = p90.astNode

    local extensionASTNodes = p90.extensionASTNodes

    t23.extensionASTNodes = if not (extensionASTNodes and #extensionASTNodes > 0) then nil else extensionASTNodes
    t23._values = defineEnumValues(t23.name, p90.values)
    t23._valueLookup = {}
    Array.forEach(t23._values, function(p91) -- line: 1612
        -- upvalues: t23 (copy), v1 (copy)
        if p91.value == p91.value then
            t23._valueLookup[p91.value] = p91
        else
            t23._valueLookup[v1] = p91
        end
    end)
    t23._nameLookup = keyMap(t23._values, function(p92) -- line: 1624
        return p92.name
    end)
    devAssert(typeof(p90.name) == "string", "Must provide name.")

    return (setmetatable(t23, t7))
end

function t7.getValues(p93) -- line: 1633
    return p93._values
end

function t7.getValue(p94, p95) -- line: 1637
    return p94._nameLookup[p95]
end

function t7.serialize(p96, p97) -- line: 1641
    -- upvalues: v1 (copy), inspect (copy), GraphQLError (copy)
    local v20 = if p97 == p97 then p96._valueLookup[p97] else p96._valueLookup[v1]

    if v20 == nil then
        error(GraphQLError.new(("Enum \"%s\" cannot represent value: %s"):format(p96.name, inspect(p97))))
    end

    return v20.name
end

function t7.parseValue(p98, p99) -- line: 1663
    -- upvalues: inspect (copy), GraphQLError (copy), didYouMeanEnumValue (ref)
    if typeof(p99) ~= "string" then
        local v21 = inspect(p99)

        error(GraphQLError.new(("Enum \"%s\" cannot represent non-string value: %s." .. didYouMeanEnumValue(p98, v21)):format(p98.name, v21)))
    end

    local v22 = p98:getValue(p99)

    if v22 == nil then
        error(GraphQLError.new(("Value \"%s\" does not exist in \"%s\" enum."):format(p99, p98.name) .. didYouMeanEnumValue(p98, p99)))
    end

    return v22.value
end

function t7.parseLiteral(p100, p101, _) -- line: 1688
    -- upvalues: GraphQLError (copy), Kind (copy), print (copy), didYouMeanEnumValue (ref)
    if p101.kind ~= Kind.ENUM then
        local v23 = print(p101)

        error(GraphQLError.new(("Enum \"%s\" cannot represent non-enum value: %s."):format(p100.name, v23) .. didYouMeanEnumValue(p100, v23), p101))
    end

    local v24 = p100:getValue(p101.value)

    if v24 == nil then
        local v25 = print(p101)

        error(GraphQLError.new(("Value \"%s\" does not exist in \"%s\" enum."):format(v25, p100.name) .. didYouMeanEnumValue(p100, v25), p101))
    end

    return v24.value
end

function t7.toConfig(p103) -- line: 1715
    -- upvalues: keyValMap (copy)
    local v26 = keyValMap(p103:getValues(), function(p104) -- line: 1717
        return p104.name
    end, function(p105) -- line: 1719
        return {
            description = p105.description,
            value = p105.value,
            deprecationReason = p105.deprecationReason,
            extensions = p105.extensions,
            astNode = p105.astNode
        }
    end)

    return {
        name = p103.name,
        description = p103.description,
        values = v26,
        extensions = p103.extensions,
        astNode = p103.astNode,
        extensionASTNodes = p103.extensionASTNodes or {}
    }
end

function t7.__tostring(p106) -- line: 1741
    return p106:toString()
end

function t7.toString(p107) -- line: 1745
    return p107.name
end

function t7.toJSON(p108) -- line: 1749
    return p108:toString()
end

function didYouMeanEnumValue(p109, p110) -- line: 1760
    -- upvalues: Array (copy), didYouMean (copy), suggestionList (copy)
    return didYouMean("the enum value", (suggestionList(p110, (Array.map(p109:getValues(), function(p111) -- line: 1761
        return p111.name
    end)))))
end

function defineEnumValues(p112, p113) -- line: 1770
    -- upvalues: Array (copy), Map (copy), coerceToMap (copy), inspect (copy), toObjMap (copy), devAssert (copy), instanceOf (copy), isPlainObj (ref)
    devAssert(isPlainObj(p113) or instanceOf(p113, Map), ("%s values must be an object with value names as keys."):format((tostring(p112))))

    local v29 = coerceToMap(p113):entries()

    return Array.map(v29, function(p114) -- line: 1781
        -- upvalues: p112 (copy), inspect (copy), toObjMap (copy), devAssert (copy), isPlainObj (ref)
        local v30 = p114[1]
        local v31 = p114[2]

        devAssert(isPlainObj(v31), ("%s.%s must refer to an object with a \"value\" key "):format(tostring(p112), (tostring(v30))) .. ("representing an internal value but got: %s."):format(inspect(v31)))

        return {
            name = tostring(v30),
            description = v31.description,
            value = if v31.value ~= nil then v31.value else v30,
            deprecationReason = v31.deprecationReason,
            extensions = if v31.extensions then toObjMap(v31.extensions) else nil,
            astNode = v31.astNode
        }
    end)
end

t8.__index = t8

function t8.new(p115) -- line: 1883
    -- upvalues: toObjMap (copy), devAssert (copy), defineInputFieldMap (ref), t8 (copy)
    local t26 = {
        name = p115.name,
        description = p115.description
    }

    t26.extensions = if p115.extensions then toObjMap(p115.extensions) else nil
    t26.astNode = p115.astNode

    local extensionASTNodes = p115.extensionASTNodes

    t26.extensionASTNodes = if not (extensionASTNodes and #extensionASTNodes > 0) then nil else extensionASTNodes

    t26._fields = function() -- line: 1891
        -- upvalues: p115 (copy), defineInputFieldMap (ref)
        return defineInputFieldMap(p115)
    end

    devAssert(typeof(p115.name) == "string", "Must provide name.")

    return (setmetatable(t26, t8))
end

function t8.getFields(p116) -- line: 1898
    if typeof(p116._fields) == "function" then
        p116._fields = p116._fields()
    end

    return p116._fields
end

function t8.toConfig(p117) -- line: 1905
    -- upvalues: mapValueOrdered (copy)
    local v33 = mapValueOrdered(p117:getFields(), function(p118) -- line: 1907
        return {
            description = p118.description,
            type = p118.type,
            defaultValue = p118.defaultValue,
            extensions = p118.extensions,
            astNode = p118.astNode
        }
    end)

    return {
        name = p117.name,
        description = p117.description,
        fields = v33,
        extensions = p117.extensions,
        astNode = p117.astNode,
        extensionASTNodes = p117.extensionASTNodes or {}
    }
end

function t8.__tostring(p119) -- line: 1927
    return p119:toString()
end

function t8.toString(p120) -- line: 1931
    return p120.name
end

function t8.toJSON(p121) -- line: 1935
    return p121:toString()
end

function defineInputFieldMap(p122) -- line: 1946
    -- upvalues: Map (copy), coerceToMap (copy), toObjMap (copy), devAssert (copy), instanceOf (copy), mapValueOrdered (copy), isPlainObj (ref)
    local fields = p122.fields

    if typeof(fields) == "function" then
        fields = fields()
    end

    devAssert(isPlainObj(fields) or instanceOf(fields, Map), ("%s fields must be an object with field names as keys or a function which returns such an object."):format(p122.name))

    return mapValueOrdered(coerceToMap(fields), function(p123, p124) -- line: 1960
        -- upvalues: p122 (copy), toObjMap (copy), devAssert (copy)
        devAssert(p123.resolve == nil, ("%s.%s field has a resolve property, but Input Types cannot define resolvers."):format(p122.name, p124))

        return {
            name = p124,
            description = p123.description,
            type = p123.type,
            defaultValue = p123.defaultValue,
            deprecationReason = p123.deprecationReason,
            extensions = if p123.extensions then toObjMap(p123.extensions) else nil,
            astNode = p123.astNode
        }
    end)
end

local function isRequiredInputField(p125) -- line: 2020
    -- upvalues: isNonNullType (ref)
    return isNonNullType(p125.type) and p125.defaultValue == nil
end

local _ = {
    new = function() -- new | line: 2030
        return {}
    end
}

return {
    GraphQLList = t1,
    GraphQLNonNull = t2,
    GraphQLScalarType = t3,
    GraphQLObjectType = t4,
    GraphQLInterfaceType = t5,
    GraphQLUnionType = t6,
    GraphQLEnumType = t7,
    GraphQLInputObjectType = t8,
    isType = isType,
    assertType = assertType,
    isScalarType = isScalarType,
    assertScalarType = assertScalarType,
    isObjectType = isObjectType,
    assertObjectType = assertObjectType,
    isInterfaceType = isInterfaceType,
    assertInterfaceType = assertInterfaceType,
    isUnionType = isUnionType,
    assertUnionType = assertUnionType,
    isEnumType = isEnumType,
    assertEnumType = assertEnumType,
    isInputObjectType = isInputObjectType,
    assertInputObjectType = assertInputObjectType,
    isListType = isListType,
    assertListType = assertListType,
    isNonNullType = isNonNullType,
    assertNonNullType = assertNonNullType,
    isInputType = isInputType,
    assertInputType = assertInputType,
    isOutputType = isOutputType,
    assertOutputType = assertOutputType,
    isLeafType = isLeafType,
    assertLeafType = assertLeafType,
    isCompositeType = isCompositeType,
    assertCompositeType = assertCompositeType,
    isAbstractType = isAbstractType,
    assertAbstractType = assertAbstractType,
    isWrappingType = isWrappingType,
    assertWrappingType = assertWrappingType,
    isNullableType = isNullableType,
    assertNullableType = assertNullableType,
    getNullableType = getNullableType,
    isNamedType = isNamedType,
    assertNamedType = assertNamedType,
    getNamedType = getNamedType,
    argsToArgsConfig = argsToArgsConfig,
    isRequiredArgument = isRequiredArgument,
    isRequiredInputField = isRequiredInputField,
    NULL = null
}
