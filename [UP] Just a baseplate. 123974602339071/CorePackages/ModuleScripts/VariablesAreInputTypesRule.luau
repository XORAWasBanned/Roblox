-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.VariablesAreInputTypesRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local print = require(ParentParent.language.printer).print
local isInputType = require(ParentParent.type.definition).isInputType
local typeFromAST = require(ParentParent.utilities.typeFromAST).typeFromAST

return {
    VariablesAreInputTypesRule = function(p1) -- line: 24
        -- upvalues: GraphQLError (copy), print (copy), isInputType (copy), typeFromAST (copy)
        return {
            VariableDefinition = function(_, p3) -- VariableDefinition | line: 26
                -- upvalues: p1 (copy), GraphQLError (copy), print (copy), isInputType (copy), typeFromAST (copy)
                local v1 = typeFromAST(p1:getSchema(), p3.type)

                if not v1 or isInputType(v1) then
                    return
                end

                local value = p3.variable.name.value
                local v2 = print(p3.type)

                p1:reportError(GraphQLError.new(("Variable \"$%s\" cannot be non-input type \"%s\"."):format(value, v2), p3.type))
            end
        }
    end
}
