-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.UniqueDirectivesPerLocationRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local language = ParentParent.language
local Kind = require(language.kinds).Kind
local predicates = require(language.predicates)
local isTypeDefinitionNode, isTypeExtensionNode = predicates.isTypeDefinitionNode, predicates.isTypeExtensionNode
local specifiedDirectives = require(ParentParent.type.directives).specifiedDirectives

return {
    UniqueDirectivesPerLocationRule = function(p1) -- line: 27
        -- upvalues: GraphQLError (copy), Kind (copy), isTypeDefinitionNode (copy), isTypeExtensionNode (copy), specifiedDirectives (copy)
        local t2 = {}
        local v1 = p1:getSchema()
        local v2 = if v1 then v1:getDirectives() else specifiedDirectives

        for _, v3 in ipairs(v2) do
            t2[v3.name] = not v3.isRepeatable
        end

        local definitions = p1:getDocument().definitions

        for _, v4 in ipairs(definitions) do
            if v4.kind == Kind.DIRECTIVE_DEFINITION then
                t2[v4.name.value] = not v4.repeatable
            end
        end

        local t3 = {}
        local t5 = {}

        return {
            enter = function(_, p3) -- enter | line: 50
                -- upvalues: p1 (copy), t2 (copy), t3 (copy), t5 (copy), GraphQLError (copy), Kind (copy), isTypeDefinitionNode (copy), isTypeExtensionNode (copy)
                if p3.directives == nil then
                    return
                end

                local v5

                if p3.kind == Kind.SCHEMA_DEFINITION or p3.kind == Kind.SCHEMA_EXTENSION then
                    v5 = t5
                elseif isTypeDefinitionNode(p3) or isTypeExtensionNode(p3) then
                    local value = p3.name.value

                    v5 = t3[value]

                    if v5 == nil then
                        v5 = {}
                        t3[value] = v5
                    end
                else
                    v5 = {}
                end

                for _, v6 in ipairs(p3.directives) do
                    local value = v6.name.value

                    if t2[value] then
                        if v5[value] then
                            p1:reportError(GraphQLError.new(("The directive \"@%s\" can only be used once at this location."):format(value), {
                                v5[value],
                                v6
                            }))
                        else
                            v5[value] = v6
                        end
                    end
                end
            end
        }
    end
}
