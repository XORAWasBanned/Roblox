-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.custom.NoDeprecatedCustomRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent.Parent
local invariant = require(ParentParent.jsutils.invariant).invariant
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local definition = require(ParentParent.type.definition)
local getNamedType, isInputObjectType = definition.getNamedType, definition.isInputObjectType

return {
    NoDeprecatedCustomRule = function(p1) -- line: 28
        -- upvalues: invariant (copy), GraphQLError (copy), getNamedType (copy), isInputObjectType (copy)
        return {
            Field = function(_, p3) -- Field | line: 30
                -- upvalues: p1 (copy), invariant (copy), GraphQLError (copy)
                local v1 = p1:getFieldDef()
                local v2, invariant2, v3, v4

                if not v1 then
                    v4 = v1

                    return
                end

                v4 = v1.deprecationReason

                if v4 ~= nil then
                    v2 = p1:getParentType()
                    invariant2 = invariant
                    v3 = v2 ~= nil
                    invariant2(v3)
                    p1:reportError(GraphQLError.new(("The field %s.%s is deprecated. %s"):format(v2.name, v1.name, v4), p3))
                end
            end,
            Argument = function(_, p5) -- Argument | line: 48
                -- upvalues: p1 (copy), invariant (copy), GraphQLError (copy)
                local v5 = p1:getArgument()

                if v5 then
                    local deprecationReason = v5.deprecationReason

                    if deprecationReason ~= nil then
                        local v6 = p1:getDirective()

                        if v6 ~= nil then
                            p1:reportError(GraphQLError.new(("Directive \"@%s\" argument \"%s\" is deprecated. %s"):format(v6.name, v5.name, deprecationReason), p5))
                        else
                            local v7 = p1:getParentType()
                            local v8 = p1:getFieldDef()

                            invariant(v7 ~= nil and v8 ~= nil)
                            p1:reportError(GraphQLError.new(("Field \"%s.%s\" argument \"%s\" is deprecated. %s"):format(v7.name, v8.name, v5.name, deprecationReason), p5))
                        end
                    end
                end
            end,
            ObjectField = function(_, p7) -- ObjectField | line: 82
                -- upvalues: p1 (copy), GraphQLError (copy), getNamedType (copy), isInputObjectType (copy)
                local v10 = getNamedType(p1:getParentInputType())

                if not isInputObjectType(v10) then
                    return
                end

                local v11 = v10:getFields():get(p7.name.value)
                local v12 = v11 and v11.deprecationReason

                if v12 ~= nil then
                    p1:reportError(GraphQLError.new(("The input field %s.%s is deprecated. %s"):format(v10.name, v11.name, v12), p7))
                end
            end,
            EnumValue = function(_, p9) -- EnumValue | line: 103
                -- upvalues: p1 (copy), invariant (copy), GraphQLError (copy), getNamedType (copy)
                local v13 = p1:getEnumValue()
                local v14, invariant2, v15, v16

                if not v13 then
                    v16 = v13

                    return
                end

                v16 = v13.deprecationReason

                if v16 ~= nil then
                    v14 = getNamedType(p1:getInputType())
                    invariant2 = invariant
                    v15 = v14 ~= nil
                    invariant2(v15)
                    p1:reportError(GraphQLError.new(("The enum value \"%s.%s\" is deprecated. %s"):format(v14.name, v13.name, v16), p9))
                end
            end
        }
    end
}
