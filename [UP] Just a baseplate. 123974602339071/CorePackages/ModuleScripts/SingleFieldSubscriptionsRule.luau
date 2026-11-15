-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.SingleFieldSubscriptionsRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local ParentParent2 = ParentParent.Parent
local Array = require(ParentParent2.LuauPolyfill).Array
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError

return {
    SingleFieldSubscriptionsRule = function(p1) -- line: 23
        -- upvalues: Array (copy), GraphQLError (copy)
        return {
            OperationDefinition = function(_, p3) -- OperationDefinition | line: 25
                -- upvalues: p1 (copy), Array (copy), GraphQLError (copy)
                local v1, new, v2

                if p3.operation == "subscription" and #p3.selectionSet.selections ~= 1 then
                    v1 = p1
                    new = GraphQLError.new
                    v2 = p3.name and ("Subscription \"%s\" must select only one top level field."):format(p3.name.value) or "Anonymous Subscription must select only one top level field."
                    v1:reportError(new(v2, Array.slice(p3.selectionSet.selections, 2)))
                end
            end
        }
    end
}
