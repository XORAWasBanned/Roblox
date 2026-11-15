-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.VariablesInAllowedPositionRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local inspect = require(ParentParent.jsutils.inspect).inspect
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local Kind = require(ParentParent.language.kinds).Kind
local isNonNullType = require(ParentParent.type.definition).isNonNullType
local utilities = ParentParent.utilities
local typeFromAST = require(utilities.typeFromAST).typeFromAST
local isTypeSubTypeOf = require(utilities.typeComparators).isTypeSubTypeOf
local allowedVariableUsage
local t1 = {
    VariablesInAllowedPositionRule = function(p1) -- line: 27
        -- upvalues: inspect (copy), GraphQLError (copy), typeFromAST (copy), allowedVariableUsage (ref)
        local t2 = {}

        return {
            OperationDefinition = {
                enter = function() -- enter | line: 32
                    -- upvalues: t2 (ref)
                    t2 = {}
                end,
                leave = function(_, p3) -- leave | line: 35
                    -- upvalues: p1 (copy), t2 (ref), inspect (copy), GraphQLError (copy), typeFromAST (copy), allowedVariableUsage (ref)
                    local v1 = p1:getRecursiveVariableUsages(p3)

                    for _, v2 in ipairs(v1) do
                        local node, type, defaultValue = v2.node, v2.type, v2.defaultValue
                        local value = node.name.value
                        local v3 = t2[value]

                        if v3 and type then
                            local v4 = p1:getSchema()
                            local v5 = typeFromAST(v4, v3.type)

                            if v5 and not allowedVariableUsage(v4, v5, v3.defaultValue, type, defaultValue) then
                                local v6 = inspect(v5)
                                local v7 = inspect(type)

                                p1:reportError(GraphQLError.new(("Variable \"$%s\" of type \"%s\" used in position expecting type \"%s\"."):format(value, v6, v7), {
                                    v3,
                                    node
                                }))
                            end
                        end
                    end
                end
            },
            VariableDefinition = function(_, p5) -- VariableDefinition | line: 79
                -- upvalues: t2 (ref)
                local t5 = t2

                t5[p5.variable.name.value] = p5
            end
        }
    end
}

function allowedVariableUsage(p6, p7, p8, p9, p10) -- line: 90
    -- upvalues: Kind (copy), isNonNullType (copy), isTypeSubTypeOf (copy)
    local v8

    if not isNonNullType(p9) or isNonNullType(p7) then
        return isTypeSubTypeOf(p6, p7, p9)
    else
        v8 = p8 ~= nil and p8.kind ~= Kind.NULL
    end

    local v10 = p10 ~= nil

    if not (v8 or v10) then
        return false
    end

    return isTypeSubTypeOf(p6, p7, p9.ofType)
end

return t1
