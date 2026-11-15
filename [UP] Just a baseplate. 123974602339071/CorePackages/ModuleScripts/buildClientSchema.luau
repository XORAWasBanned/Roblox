-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.buildClientSchema
-- https://lua.expert

local ParentParent = script.Parent.Parent
local luaUtils, ParentParent2 = ParentParent.luaUtils, ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Error = LuauPolyfill.Array, LuauPolyfill.Error
local null = require(luaUtils.null)
local isNillish = require(luaUtils.isNillish)
local isNillish2, isNotNillish = isNillish.isNillish, isNillish.isNotNillish
local inspect = require(ParentParent.jsutils.inspect).inspect
local devAssert = require(ParentParent.jsutils.devAssert).devAssert
local keyValMap = require(ParentParent.jsutils.keyValMap).keyValMap
local isObjectLike = require(ParentParent.jsutils.isObjectLike).isObjectLike
local parseValue = require(ParentParent.language.parser).parseValue
local schema = require(ParentParent.type.schema)
local definition = require(ParentParent.type.definition)
local GraphQLSchema = schema.GraphQLSchema
local GraphQLDirective = require(ParentParent.type.directives).GraphQLDirective
local specifiedScalarTypes = require(ParentParent.type.scalars).specifiedScalarTypes
local introspection = require(ParentParent.type.introspection)
local introspectionTypes, TypeKind = introspection.introspectionTypes, introspection.TypeKind
local isInputType, isOutputType, GraphQLList, GraphQLNonNull = definition.isInputType, definition.isOutputType, definition.GraphQLList, definition.GraphQLNonNull
local GraphQLScalarType, GraphQLObjectType, GraphQLInterfaceType, GraphQLUnionType = definition.GraphQLScalarType, definition.GraphQLObjectType, definition.GraphQLInterfaceType, definition.GraphQLUnionType
local GraphQLEnumType, GraphQLInputObjectType, assertNullableType, assertObjectType = definition.GraphQLEnumType, definition.GraphQLInputObjectType, definition.assertNullableType, definition.assertObjectType
local assertInterfaceType = definition.assertInterfaceType

require(script.Parent.getIntrospectionQuery)

local valueFromAST = require(script.Parent.valueFromAST).valueFromAST

return {
    buildClientSchema = function(p1, p2) -- buildClientSchema | line: 100
        -- upvalues: Array (copy), Error (copy), null (copy), isNillish2 (copy), isNotNillish (copy), inspect (copy), devAssert (copy), keyValMap (copy), isObjectLike (copy), parseValue (copy), GraphQLSchema (copy), GraphQLDirective (copy), specifiedScalarTypes (copy), introspectionTypes (copy), TypeKind (copy), isInputType (copy), isOutputType (copy), GraphQLList (copy), GraphQLNonNull (copy), GraphQLScalarType (copy), GraphQLObjectType (copy), GraphQLInterfaceType (copy), GraphQLUnionType (copy), GraphQLEnumType (copy), GraphQLInputObjectType (copy), assertNullableType (copy), assertObjectType (copy), assertInterfaceType (copy), valueFromAST (copy)
        local getNamedType, buildScalarDef, buildObjectDef, buildInterfaceDef, buildUnionDef, buildEnumDef, buildInputObjectDef, buildFieldDefMap, buildField, buildInputValueDefMap, buildInputValue, v1, getType

        function getType(p3) -- line: 132
            -- upvalues: getType (ref), getNamedType (ref), Error (copy), TypeKind (copy), GraphQLList (copy), GraphQLNonNull (copy), assertNullableType (copy)
            if p3.kind == TypeKind.LIST then
                local ofType = p3.ofType

                if not ofType then
                    error(Error.new("Decorated type deeper than introspection query."))
                end

                return GraphQLList.new(getType(ofType))
            end

            if p3.kind ~= TypeKind.NON_NULL then
                return getNamedType(p3)
            end

            local ofType = p3.ofType

            if not ofType then
                error(Error.new("Decorated type deeper than introspection query."))
            end

            local v2 = getType(ofType)

            return GraphQLNonNull.new(assertNullableType(v2))
        end

        function getNamedType(p4) -- line: 155
            -- upvalues: v1 (ref), Error (copy), isNillish2 (copy), inspect (copy)
            local name = p4.name

            if isNillish2(name) then
                error(Error.new(("Unknown type reference: %s."):format(inspect(p4))))
            end

            local v3 = v1:get(name)

            if isNillish2(v3) then
                error(Error.new(("Invalid or incomplete schema, unknown type: %s. Ensure that a full introspection query is used in order to build a client schema."):format(name)))
            end

            return v3
        end

        local function getObjectType(p5) -- line: 176
            -- upvalues: getNamedType (ref), assertObjectType (copy)
            return assertObjectType(getNamedType(p5))
        end

        local function getInterfaceType(p6) -- line: 182
            -- upvalues: getNamedType (ref), assertInterfaceType (copy)
            return assertInterfaceType(getNamedType(p6))
        end

        local function buildType(p7) -- line: 190
            -- upvalues: buildScalarDef (ref), buildObjectDef (ref), buildInterfaceDef (ref), buildUnionDef (ref), buildEnumDef (ref), buildInputObjectDef (ref), Error (copy), isNotNillish (copy), inspect (copy), TypeKind (copy)
            if isNotNillish(p7) and isNotNillish(p7.name) and isNotNillish(p7.kind) then
                if p7.kind == TypeKind.SCALAR then
                    return buildScalarDef(p7)
                end

                if p7.kind == TypeKind.OBJECT then
                    return buildObjectDef(p7)
                end

                if p7.kind == TypeKind.INTERFACE then
                    return buildInterfaceDef(p7)
                end

                if p7.kind == TypeKind.UNION then
                    return buildUnionDef(p7)
                end

                if p7.kind == TypeKind.ENUM then
                    return buildEnumDef(p7)
                end

                if p7.kind == TypeKind.INPUT_OBJECT then
                    return buildInputObjectDef(p7)
                end
            end

            local v4 = inspect(p7)

            error(Error.new(("Invalid or incomplete introspection result. Ensure that a full introspection query is used in order to build a client schema: %s."):format(v4)))
        end

        function buildScalarDef(p8) -- line: 217
            -- upvalues: GraphQLScalarType (copy)
            return GraphQLScalarType.new({
                name = p8.name,
                description = p8.description,
                specifiedByUrl = p8.specifiedByUrl
            })
        end

        local function buildImplementationsList(p9) -- line: 225
            -- upvalues: getInterfaceType (copy), Array (copy), Error (copy), inspect (copy), TypeKind (copy)
            if p9.interfaces == nil and p9.kind == TypeKind.INTERFACE then
                return {}
            end

            if not p9.interfaces then
                local v5 = inspect(p9)

                error(Error.new(("Introspection result missing interfaces: %s."):format(v5)))
            end

            return Array.map(p9.interfaces, getInterfaceType)
        end

        function buildObjectDef(p10) -- line: 251
            -- upvalues: buildFieldDefMap (ref), buildImplementationsList (copy), GraphQLObjectType (copy)
            return GraphQLObjectType.new({
                name = p10.name,
                description = p10.description,
                interfaces = function() -- interfaces | line: 255
                    -- upvalues: p10 (copy), buildImplementationsList (copy)
                    return buildImplementationsList(p10)
                end,
                fields = function() -- fields | line: 258
                    -- upvalues: p10 (copy), buildFieldDefMap (ref)
                    return buildFieldDefMap(p10)
                end
            })
        end

        function buildInterfaceDef(p11) -- line: 264
            -- upvalues: buildFieldDefMap (ref), buildImplementationsList (copy), GraphQLInterfaceType (copy)
            return GraphQLInterfaceType.new({
                name = p11.name,
                description = p11.description,
                interfaces = function() -- interfaces | line: 270
                    -- upvalues: p11 (copy), buildImplementationsList (copy)
                    return buildImplementationsList(p11)
                end,
                fields = function() -- fields | line: 273
                    -- upvalues: p11 (copy), buildFieldDefMap (ref)
                    return buildFieldDefMap(p11)
                end
            })
        end

        function buildUnionDef(p12) -- line: 279
            -- upvalues: getObjectType (copy), Array (copy), Error (copy), inspect (copy), GraphQLUnionType (copy)
            if not p12.possibleTypes then
                local v6 = inspect(p12)

                error(Error.new(("Introspection result missing possibleTypes: %s."):format(v6)))
            end

            return GraphQLUnionType.new({
                name = p12.name,
                description = p12.description,
                types = function() -- types | line: 294
                    -- upvalues: p12 (copy), getObjectType (copy), Array (copy)
                    return Array.map(p12.possibleTypes, getObjectType)
                end
            })
        end

        function buildEnumDef(p13) -- line: 300
            -- upvalues: Error (copy), inspect (copy), keyValMap (copy), GraphQLEnumType (copy)
            if not p13.enumValues then
                local v7 = inspect(p13)

                error(Error.new(("Introspection result missing enumValues: %s."):format(v7)))
            end

            return GraphQLEnumType.new({
                name = p13.name,
                description = p13.description,
                values = keyValMap(p13.enumValues, function(p14) -- line: 312
                    return p14.name
                end, function(p15) -- line: 314
                    return {
                        description = p15.description,
                        deprecationReason = p15.deprecationReason
                    }
                end)
            })
        end

        function buildInputObjectDef(p16) -- line: 324
            -- upvalues: buildInputValueDefMap (ref), Error (copy), inspect (copy), GraphQLInputObjectType (copy)
            if not p16.inputFields then
                local v8 = inspect(p16)

                error(Error.new(("Introspection result missing inputFields: %s."):format(v8)))
            end

            return GraphQLInputObjectType.new({
                name = p16.name,
                description = p16.description,
                fields = function() -- fields | line: 340
                    -- upvalues: p16 (copy), buildInputValueDefMap (ref)
                    return buildInputValueDefMap(p16.inputFields)
                end
            })
        end

        function buildFieldDefMap(p17) -- line: 346
            -- upvalues: buildField (ref), Error (copy), inspect (copy), keyValMap (copy)
            if not p17.fields then
                error(Error.new(("Introspection result missing fields: %s."):format(inspect(p17))))
            end

            return keyValMap(p17.fields, function(p18) -- line: 358
                return p18.name
            end, buildField)
        end

        function buildField(p19) -- line: 363
            -- upvalues: getType (ref), buildInputValueDefMap (ref), Error (copy), inspect (copy), isOutputType (copy)
            local v9 = getType(p19.type)

            if not isOutputType(v9) then
                local v10 = inspect(v9)

                error(Error.new(("Introspection must provide output type for fields, but received: %s."):format(v10)))
            end

            if not p19.args then
                local v11 = inspect(p19)

                error(Error.new(("Introspection result missing field args: %s."):format(v11)))
            end

            return {
                description = p19.description,
                deprecationReason = p19.deprecationReason,
                type = v9,
                args = buildInputValueDefMap(p19.args)
            }
        end

        function buildInputValueDefMap(p20) -- line: 394
            -- upvalues: buildInputValue (ref), keyValMap (copy)
            return keyValMap(p20, function(p21) -- line: 395
                return p21.name
            end, buildInputValue)
        end

        function buildInputValue(p22) -- line: 400
            -- upvalues: getType (ref), Error (copy), isNotNillish (copy), inspect (copy), parseValue (copy), isInputType (copy), valueFromAST (copy)
            local v12 = getType(p22.type)

            if not isInputType(v12) then
                local v13 = inspect(v12)

                error(Error.new(("Introspection must provide input type for arguments, but received: %s."):format(v13)))
            end

            local v14 = if isNotNillish(p22.defaultValue) then valueFromAST(parseValue(p22.defaultValue), v12) else nil

            return {
                description = p22.description,
                type = v12,
                defaultValue = v14,
                deprecationReason = p22.deprecationReason
            }
        end

        local function buildDirective(p23) -- line: 429
            -- upvalues: buildInputValueDefMap (ref), Array (copy), Error (copy), inspect (copy), GraphQLDirective (copy)
            if not p23.args then
                local v15 = inspect(p23)

                error(Error.new(("Introspection result missing directive args: %s."):format(v15)))
            end

            if not p23.locations then
                local v16 = inspect(p23)

                error(Error.new(("Introspection result missing directive locations: %s."):format(v16)))
            end

            return GraphQLDirective.new({
                name = p23.name,
                description = p23.description,
                isRepeatable = p23.isRepeatable,
                locations = Array.slice(p23.locations),
                args = buildInputValueDefMap(p23.args)
            })
        end

        devAssert(isObjectLike(p1) and isObjectLike(p1.__schema), ("Invalid or incomplete introspection result. Ensure that you are passing \"data\" property of introspection response and no \"errors\" was returned alongside: %s."):format(inspect(p1)))

        local __schema = p1.__schema

        v1 = keyValMap(__schema.types, function(p24) -- line: 471
            return p24.name
        end, function(p25) -- line: 473
            -- upvalues: buildType (copy)
            return buildType(p25)
        end)

        for _, v18 in ipairs(Array.concat(specifiedScalarTypes, introspectionTypes)) do
            local name = v18.name

            if v1:get(name) then
                local name = v18.name

                v1:set(name, v18)
            end
        end

        local v19 = if isNotNillish(__schema.queryType) then getObjectType(__schema.queryType) else null
        local v20 = if isNotNillish(__schema.mutationType) then getObjectType(__schema.mutationType) else null
        local v21 = if isNotNillish(__schema.subscriptionType) then getObjectType(__schema.subscriptionType) else null
        local v22 = if isNotNillish(__schema.directives) then Array.map(__schema.directives, buildDirective) else {}

        return GraphQLSchema.new({
            description = __schema.description,
            query = v19,
            mutation = v20,
            subscription = v21,
            types = v1:values(),
            directives = v22,
            assumeValid = if p2 then p2.assumeValid else nil
        })
    end
}
