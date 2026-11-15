-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.getOperationRootType
-- https://lua.expert

local GraphQLError = require(script.Parent.Parent.error.GraphQLError).GraphQLError

require(script.Parent.Parent.language.ast)
require(script.Parent.Parent.type.definition)
require(script.Parent.Parent.type.schema)

return {
    getOperationRootType = function(p1, p2) -- getOperationRootType | line: 22
        -- upvalues: GraphQLError (copy)
        if p2.operation == "query" then
            local v1 = p1:getQueryType()

            if not v1 then
                error(GraphQLError.new("Schema does not define the required query root type.", p2))
            end

            return v1
        end

        if p2.operation == "mutation" then
            local v2 = p1:getMutationType()

            if not v2 then
                error(GraphQLError.new("Schema is not configured for mutations.", p2))
            end

            return v2
        end

        if p2.operation == "subscription" then
            local v3 = p1:getSubscriptionType()

            if not v3 then
                error(GraphQLError.new("Schema is not configured for subscriptions.", p2))
            end

            return v3
        end

        error(GraphQLError.new("Can only have query, mutation and subscription operations.", p2))
    end
}
