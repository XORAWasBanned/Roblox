-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.merge-typedefs
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local LuauPolyfill = require(ParentParent.LuauPolyfill)
local Array, Boolean, Error, Object = LuauPolyfill.Array, LuauPolyfill.Boolean, LuauPolyfill.Error, LuauPolyfill.Object
local Set = LuauPolyfill.Set
local t1 = {}

require(script.Parent["merge-typedefs_types"])

local mergeGraphQLTypes
local GraphQL = require(ParentParent.GraphQL)
local parse, Kind, isSchema, isDefinitionNode = GraphQL.parse, GraphQL.Kind, GraphQL.isSchema, GraphQL.isDefinitionNode
local utils = require(script.Parent.utils)
local defaultStringComparator, isSourceTypes, isStringTypes = utils.defaultStringComparator, utils.isSourceTypes, utils.isStringTypes
local v1 = require(script.Parent["merge-nodes"])
local mergeGraphQLNodes, schemaDefSymbol = v1.mergeGraphQLNodes, v1.schemaDefSymbol
local Utils = require(ParentParent.Utils)
local getDocumentNodeFromSchema, isDocumentNode, resetComments, printWithComments = Utils.getDocumentNodeFromSchema, Utils.isDocumentNode, Utils.resetComments, Utils.printWithComments
local DEFAULT_OPERATION_TYPE_NAME_MAP = require(script.Parent["schema-def"]).DEFAULT_OPERATION_TYPE_NAME_MAP

function t1.mergeTypeDefs(p1, p2) -- line: 159
    -- upvalues: Object (copy), mergeGraphQLTypes (ref), Kind (copy), resetComments (copy), printWithComments (copy)
    resetComments()

    local v2 = {
        kind = Kind.DOCUMENT,
        definitions = mergeGraphQLTypes(p1, Object.assign({}, {
            useSchemaDefinition = true,
            forceSchemaDefinition = false,
            throwOnConflict = false,
            commentDescriptions = false
        }, p2))
    }

    if p2 and p2.commentDescriptions then
        v2 = printWithComments(v2)
    end

    resetComments()

    return v2
end

local function visitTypeSources(p3, p4, p5, p6) -- line: 188
    -- upvalues: Array (copy), Boolean (copy), Error (copy), Set (copy), parse (copy), isSchema (copy), isDefinitionNode (copy), isSourceTypes (copy), isStringTypes (copy), getDocumentNodeFromSchema (copy), isDocumentNode (copy), visitTypeSources (copy)
    local v3 = if p5 == nil then {} else p5
    local v4 = if p6 == nil then Set.new() else p6

    if Boolean.toJSBoolean(if Boolean.toJSBoolean(p3) then not Boolean.toJSBoolean(v4:has(p3)) else p3) then
        v4:add(p3)

        if typeof(p3) == "function" then
            visitTypeSources(p3(), p4, v3, v4)

            return v3
        end

        if Boolean.toJSBoolean(Array.isArray(p3)) then
            for _, v5 in p3 do
                visitTypeSources(v5, p4, v3, v4)
            end

            return v3
        end

        if Boolean.toJSBoolean(isSchema(p3)) then
            visitTypeSources(getDocumentNodeFromSchema(p3, p4).definitions, p4, v3, v4)

            return v3
        end

        local toJSBoolean = Boolean.toJSBoolean
        local v7 = isStringTypes(p3)

        if toJSBoolean(Boolean.toJSBoolean(v7) and v7 or isSourceTypes(p3)) then
            visitTypeSources(parse(p3, p4).definitions, p4, v3, v4)

            return v3
        end

        if Boolean.toJSBoolean(typeof(p3) == "table" and isDefinitionNode(p3)) then
            table.insert(v3, p3)

            return v3
        end

        if isDocumentNode(p3) then
            visitTypeSources(p3.definitions, p4, v3, v4)

            return v3
        end

        error(Error.new(("typeDefs must contain only strings, documents, schemas, or functions, got %s"):format((tostring((typeof(p3)))))))
    end

    return v3
end

function mergeGraphQLTypes(p7, p8) -- line: 262
    -- upvalues: Array (copy), Boolean (copy), Kind (copy), defaultStringComparator (copy), mergeGraphQLNodes (copy), schemaDefSymbol (copy), resetComments (copy), DEFAULT_OPERATION_TYPE_NAME_MAP (copy), visitTypeSources (copy)
    resetComments()

    local v11 = mergeGraphQLNodes(visitTypeSources(p7, p8), p8)

    if p8 and Boolean.toJSBoolean(p8.useSchemaDefinition) then
        local v12

        if Boolean.toJSBoolean(v11:get(schemaDefSymbol)) then
            v12 = v11:get(schemaDefSymbol)

            if not v12 then
                v12 = {}
                v12.kind = Kind.SCHEMA_DEFINITION
                v12.operationTypes = {}
            end
        else
            v12 = {}
            v12.kind = Kind.SCHEMA_DEFINITION
            v12.operationTypes = {}
        end

        local operationTypes = v12.operationTypes

        for v13 in DEFAULT_OPERATION_TYPE_NAME_MAP do
            local v14 = Array.find(operationTypes, function(p9) -- line: 288
                -- upvalues: v13 (copy)
                return p9.operation == v13
            end)

            if not Boolean.toJSBoolean(v14) then
                local v15 = v11:get(DEFAULT_OPERATION_TYPE_NAME_MAP[tostring(v13)])

                if v15 ~= nil and v15.name ~= nil then
                    table.insert(operationTypes, {
                        kind = Kind.OPERATION_TYPE_DEFINITION,
                        type = {
                            kind = Kind.NAMED_TYPE,
                            name = v15.name
                        },
                        operation = v13
                    })
                end
            end
        end

        if typeof(v12) == "table" and typeof(v12.operationTypes) == "table" and #v12.operationTypes > 0 then
            v11:set(schemaDefSymbol, v12)
        end
    end

    if p8 and Boolean.toJSBoolean(p8.forceSchemaDefinition) and (typeof(v11:get(schemaDefSymbol)) ~= "table" or typeof(v11:get(schemaDefSymbol).operationTypes) ~= "table" or not (#v11:get(schemaDefSymbol).operationTypes > 0)) then
        v11:set(schemaDefSymbol, {
            kind = Kind.SCHEMA_DEFINITION,
            operationTypes = {
                {
                    operation = "query",
                    kind = Kind.OPERATION_TYPE_DEFINITION,
                    type = {
                        kind = Kind.NAMED_TYPE,
                        name = {
                            value = "Query",
                            kind = Kind.NAME
                        }
                    }
                }
            }
        })
    end

    local v17 = v11:values()

    if p8 and Boolean.toJSBoolean(p8.sort) then
        local v18 = if typeof(p8.sort) == "function" then p8.sort else defaultStringComparator

        Array.sort(v17, function(p10, p11) -- line: 392
            -- upvalues: v18 (copy)
            return v18(if typeof(p10.name) == "table" then p10.name.value else nil, if typeof(p11.name) == "table" then p11.name.value else nil)
        end)
    end

    return v17
end

t1.mergeGraphQLTypes = mergeGraphQLTypes

return t1
