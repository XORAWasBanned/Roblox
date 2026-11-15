-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.LoneSchemaDefinitionRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local isNillish = require(ParentParent.luaUtils.isNillish)
local isNillish2, isNotNillish = isNillish.isNillish, isNillish.isNotNillish

return {
    LoneSchemaDefinitionRule = function(p1) -- line: 24
        -- upvalues: GraphQLError (copy), isNillish2 (copy), isNotNillish (copy)
        local v1 = p1:getSchema()
        local v2

        if v1 then
            local astNode = v1.astNode

            v2 = astNode

            if isNillish2(astNode) then
                astNode = v1:getQueryType()
                v2 = astNode
            end

            if isNillish2(astNode) then
                astNode = v1:getMutationType()
                v2 = astNode
            end

            if isNillish2(astNode) then
                v2 = v1:getSubscriptionType()
            end
        end

        local n1 = 0

        return {
            SchemaDefinition = function(_, p3) -- SchemaDefinition | line: 42
                -- upvalues: p1 (copy), v2 (ref), n1 (ref), GraphQLError (copy), isNotNillish (copy)
                if isNotNillish(v2) then
                    p1:reportError(GraphQLError.new("Cannot define a new schema within a schema extension.", p3))
                else
                    if n1 > 0 then
                        p1:reportError(GraphQLError.new("Must provide only one schema definition.", p3))
                    end

                    n1 += 1
                end
            end
        }
    end
}
