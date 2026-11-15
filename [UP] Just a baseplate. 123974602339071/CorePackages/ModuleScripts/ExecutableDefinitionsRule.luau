-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.ExecutableDefinitionsRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local language = ParentParent.language
local Kind = require(language.kinds).Kind
local isExecutableDefinitionNode = require(language.predicates).isExecutableDefinitionNode

return {
    ExecutableDefinitionsRule = function(p1) -- line: 23
        -- upvalues: GraphQLError (copy), Kind (copy), isExecutableDefinitionNode (copy)
        return {
            Document = function(_, p3) -- Document | line: 25
                -- upvalues: p1 (copy), GraphQLError (copy), Kind (copy), isExecutableDefinitionNode (copy)
                for _, v1 in ipairs(p3.definitions) do
                    if not isExecutableDefinitionNode(v1) then
                        local v2 = if v1.kind == Kind.SCHEMA_DEFINITION or v1.kind == Kind.SCHEMA_EXTENSION then "schema" else "\"" .. v1.name.value .. "\""

                        p1:reportError(GraphQLError.new(("The %s definition is not executable."):format(v2), v1))
                    end
                end

                return false
            end
        }
    end
}
