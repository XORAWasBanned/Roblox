-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.PossibleFragmentSpreadsRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local inspect = require(ParentParent.jsutils.inspect).inspect
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local isCompositeType = require(ParentParent.type.definition).isCompositeType
local utilities = ParentParent.utilities
local typeFromAST = require(utilities.typeFromAST).typeFromAST
local doTypesOverlap = require(utilities.typeComparators).doTypesOverlap
local getFragmentType
local t1 = {
    PossibleFragmentSpreadsRule = function(p1) -- line: 31
        -- upvalues: inspect (copy), GraphQLError (copy), isCompositeType (copy), doTypesOverlap (copy), getFragmentType (ref)
        return {
            InlineFragment = function(_, p3) -- InlineFragment | line: 33
                -- upvalues: p1 (copy), inspect (copy), GraphQLError (copy), isCompositeType (copy), doTypesOverlap (copy)
                local v1 = p1:getType()
                local v2 = p1:getParentType()

                if isCompositeType(v1) and isCompositeType(v2) and not doTypesOverlap(p1:getSchema(), v1, v2) then
                    local v3 = inspect(v2)
                    local v4 = inspect(v1)

                    p1:reportError(GraphQLError.new(("Fragment cannot be spread here as objects of type \"%s\" can never be of type \"%s\"."):format(v3, v4), p3))
                end
            end,
            FragmentSpread = function(_, p5) -- FragmentSpread | line: 54
                -- upvalues: p1 (copy), inspect (copy), GraphQLError (copy), doTypesOverlap (copy), getFragmentType (ref)
                local value = p5.name.value
                local v5 = getFragmentType(p1, value)
                local v6 = p1:getParentType()

                if v5 and v6 and not doTypesOverlap(p1:getSchema(), v5, v6) then
                    local v7 = inspect(v6)
                    local v8 = inspect(v5)

                    p1:reportError(GraphQLError.new(("Fragment \"%s\" cannot be spread here as objects of type \"%s\" can never be of type \"%s\"."):format(value, v7, v8), p5))
                end
            end
        }
    end
}

function getFragmentType(p6, p7) -- line: 78
    -- upvalues: isCompositeType (copy), typeFromAST (copy)
    local v9 = p6:getFragment(p7)
    local v10, v11

    if v9 then
        v10 = typeFromAST(p6:getSchema(), v9.typeCondition)
        v11 = isCompositeType(v10)
    end

    return if v9 and v11 then v10 else nil
end

return t1
