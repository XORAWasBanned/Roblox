-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.type.schema
-- https://lua.expert

local ParentParent = script.Parent.Parent
local luaUtils, ParentParent2 = ParentParent.luaUtils, ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Error, Map, Set = LuauPolyfill.Array, LuauPolyfill.Error, LuauPolyfill.Map, LuauPolyfill.Set
local isNillish = require(luaUtils.isNillish)
local isNillish2, isNotNillish = isNillish.isNillish, isNillish.isNotNillish

require(luaUtils.null)

local jsutils = ParentParent.jsutils
local inspect = require(jsutils.inspect).inspect
local toObjMap = require(jsutils.toObjMap).toObjMap
local devAssert = require(jsutils.devAssert).devAssert
local instanceOf = require(jsutils.instanceOf)
local isObjectLike = require(jsutils.isObjectLike).isObjectLike
local __Schema = require(script.Parent.introspection).__Schema

require(ParentParent.language.ast)
require(ParentParent.error.GraphQLError)

local directives = require(script.Parent.directives)
local isDirective, specifiedDirectives = directives.isDirective, directives.specifiedDirectives

require(jsutils.ObjMap)

local definition = require(script.Parent.definition)
local isObjectType, isInterfaceType, isUnionType, isInputObjectType = definition.isObjectType, definition.isInterfaceType, definition.isUnionType, definition.isInputObjectType
local getNamedType = definition.getNamedType
local t1, collectReferencedTypes

local function isSchema(p1) -- line: 74
    -- upvalues: instanceOf (copy), t1 (ref)
    return instanceOf(p1, t1)
end

local function assertSchema(p2) -- line: 78
    -- upvalues: Error (copy), inspect (copy), instanceOf (copy), t1 (ref)
    if not instanceOf(p2, t1) then
        error(Error.new(("Expected %s to be a GraphQL schema."):format(inspect(p2))))
    end

    return p2
end

t1 = {}
t1.__index = t1

function t1.new(p3) -- line: 200
    -- upvalues: Array (copy), Error (copy), Map (copy), Set (copy), isNillish2 (copy), isNotNillish (copy), inspect (copy), toObjMap (copy), devAssert (copy), isObjectLike (copy), __Schema (copy), isDirective (copy), specifiedDirectives (copy), isObjectType (copy), isInterfaceType (copy), t1 (ref), collectReferencedTypes (ref)
    local self = setmetatable({}, t1)

    self.__validationErrors = nil

    if p3.assumeValid == true then
        self.__validationErrors = {}
    end

    devAssert(isObjectLike(p3), "Must provide configuration object.")
    devAssert(not p3.types or Array.isArray(p3.types), ("\"types\" must be Array if provided but got: %s."):format(inspect(p3.types)))
    devAssert(not p3.directives or Array.isArray(p3.directives), "\"directives\" must be Array if provided but got: " .. ("%s."):format(inspect(p3.directives)))
    self.description = p3.description

    if p3.extensions then
        self.extensions = toObjMap(p3.extensions)
    else
        self.extensions = nil
    end

    self.astNode = p3.astNode
    self.extensionASTNodes = p3.extensionASTNodes
    self._queryType = p3.query
    self._mutationType = p3.mutation
    self._subscriptionType = p3.subscription
    self._directives = p3.directives or specifiedDirectives

    local v2 = Set.new()

    for _, v3 in ipairs(p3.types or {}) do
        v2:add(v3)
    end

    if p3.types ~= nil then
        for _, v4 in ipairs(p3.types) do
            v2:delete(v4)
            collectReferencedTypes(v4, v2)
        end
    end

    if isNotNillish(self._queryType) then
        collectReferencedTypes(self._queryType, v2)
    end

    if isNotNillish(self._mutationType) then
        collectReferencedTypes(self._mutationType, v2)
    end

    if isNotNillish(self._subscriptionType) then
        collectReferencedTypes(self._subscriptionType, v2)
    end

    for _, v5 in ipairs(self._directives) do
        if isDirective(v5) then
            for _, v6 in ipairs(v5.args) do
                collectReferencedTypes(v6.type, v2)
            end
        end
    end

    collectReferencedTypes(__Schema, v2)
    self._typeMap = Map.new()
    self._subTypeMap = Map.new()
    self._implementationsMap = Map.new()

    for _, v7 in v2 do
        if not isNillish2(v7) then
            local v8 = if typeof(v7) == "table" then v7.name else tostring(v7)

            devAssert(v8 and v8 ~= "", "One of the provided types for building the Schema is missing a name.")

            if self._typeMap:has(v8) then
                error(Error.new(("Schema must contain uniquely named types but contains multiple types named \"%s\"."):format(v8)))
            end

            self._typeMap:set(v8, v7)

            if isInterfaceType(v7) then
                for _, v9 in ipairs(v7:getInterfaces()) do
                    if isInterfaceType(v9) then
                        local v10 = self._implementationsMap:get(v9.name)

                        if v10 == nil then
                            v10 = {
                                objects = {},
                                interfaces = {}
                            }
                            self._implementationsMap:set(v9.name, v10)
                        end

                        table.insert(v10.interfaces, v7)
                    end
                end
            elseif isObjectType(v7) then
                for _, v11 in ipairs(v7:getInterfaces()) do
                    if isInterfaceType(v11) then
                        local v12 = self._implementationsMap:get(v11.name)

                        if v12 == nil then
                            v12 = {
                                objects = {},
                                interfaces = {}
                            }
                            self._implementationsMap:set(v11.name, v12)
                        end

                        table.insert(v12.objects, v7)
                    end
                end
            end
        end
    end

    return self
end

function t1:getQueryType() -- line: 349
    return self._queryType
end

function t1:getMutationType() -- line: 353
    return self._mutationType
end

function t1:getSubscriptionType() -- line: 357
    return self._subscriptionType
end

function t1:getTypeMap() -- line: 361
    return self._typeMap
end

function t1:getType(p9) -- line: 365
    return self:getTypeMap()[p9]
end

function t1:getPossibleTypes(p11) -- line: 369
    -- upvalues: isUnionType (copy)
    if isUnionType(p11) then
        return p11:getTypes()
    end

    return self:getImplementations(p11).objects
end

function t1:getImplementations(p13) -- line: 378
    return self._implementationsMap:get(p13.name) or {
        objects = {},
        interfaces = {}
    }
end

function t1:isSubType(p15, p16) -- line: 388
    -- upvalues: isUnionType (copy)
    local v13 = self._subTypeMap[p15.name]

    if v13 == nil then
        v13 = {}

        if isUnionType(p15) then
            for _, v14 in ipairs(p15:getTypes()) do
                v13[v14.name] = true
            end
        else
            local v15 = self:getImplementations(p15)

            for _, v16 in ipairs(v15.objects) do
                v13[v16.name] = true
            end

            for _, v17 in ipairs(v15.interfaces) do
                v13[v17.name] = true
            end
        end

        self._subTypeMap:set(p15.name, v13)
    end

    return v13[p16.name] ~= nil
end

function t1:getDirectives() -- line: 417
    return self._directives
end

function t1:getDirective(p19) -- line: 421
    -- upvalues: Array (copy)
    return Array.find(self:getDirectives(), function(p20) -- line: 422
        -- upvalues: p19 (copy)
        return p20.name == p19
    end)
end

function t1:toConfig() -- line: 427
    -- upvalues: Array (copy)
    return {
        description = self.description,
        query = self:getQueryType(),
        mutation = self:getMutationType(),
        subscription = self:getSubscriptionType(),
        types = self:getTypeMap():values(),
        directives = Array.slice(self:getDirectives()),
        extensions = self.extensions,
        astNode = self.astNode,
        extensionASTNodes = self.extensionASTNodes or {},
        assumeValid = self.__validationErrors ~= nil
    }
end

function t1.__tostring(_) -- line: 443
    return "GraphQLSchema"
end

function collectReferencedTypes(p23, p24) -- line: 485
    -- upvalues: isObjectType (copy), isInterfaceType (copy), isUnionType (copy), isInputObjectType (copy), getNamedType (copy), collectReferencedTypes (ref)
    local v18 = getNamedType(p23)

    if not p24:has(v18) then
        p24:add(v18)

        if isUnionType(v18) then
            for _, v19 in ipairs(v18:getTypes()) do
                collectReferencedTypes(v19, p24)
            end

            return p24
        end

        if isObjectType(v18) or isInterfaceType(v18) then
            for _, v20 in ipairs(v18:getInterfaces()) do
                collectReferencedTypes(v20, p24)
            end

            for _, v21 in ipairs(v18:getFields():values()) do
                collectReferencedTypes(v21.type, p24)

                for _, v22 in ipairs(v21.args) do
                    collectReferencedTypes(v22.type, p24)
                end
            end

            return p24
        end

        if isInputObjectType(v18) then
            for _, v23 in ipairs(v18:getFields():values()) do
                collectReferencedTypes(v23.type, p24)
            end
        end
    end

    return p24
end

return {
    isSchema = isSchema,
    assertSchema = assertSchema,
    GraphQLSchema = t1
}
