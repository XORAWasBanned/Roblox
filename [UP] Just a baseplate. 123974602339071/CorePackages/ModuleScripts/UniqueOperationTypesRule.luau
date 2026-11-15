-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.UniqueOperationTypesRule
-- https://lua.expert

local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
    UniqueOperationTypesRule = function(p1) -- line: 19
        -- upvalues: GraphQLError (copy)
        local v1 = p1:getSchema()
        local t2 = {}
        local v2 = v1 and {
            query = v1:getQueryType(),
            mutation = v1:getMutationType(),
            subscription = v1:getSubscriptionType()
        } or {}

        local function checkOperationTypes(_, p3) -- line: 32
            -- upvalues: p1 (copy), t2 (copy), v2 (copy), GraphQLError (copy)
            local v3 = p3.operationTypes or {}

            for _, v4 in ipairs(v3) do
                local operation = v4.operation
                local v5 = t2[operation]

                if v2[operation] then
                    p1:reportError(GraphQLError.new(("Type for %s already defined in the schema. It cannot be redefined."):format(operation), v4))
                elseif v5 then
                    p1:reportError(GraphQLError.new(("There can be only one %s type in schema."):format(operation), {
                        v5,
                        v4
                    }))
                else
                    t2[operation] = v4
                end
            end

            return false
        end

        return {
            SchemaDefinition = checkOperationTypes,
            SchemaExtension = checkOperationTypes
        }
    end
}
