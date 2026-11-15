-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.LoneAnonymousOperationRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local ParentParent2 = ParentParent.Parent
local Array = require(ParentParent2.LuauPolyfill).Array
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local language = ParentParent.language
local Kind = require(language.kinds).Kind

return {
    LoneAnonymousOperationRule = function(p1) -- line: 26
        -- upvalues: Array (copy), GraphQLError (copy), Kind (copy)
        local n1 = 0

        return {
            Document = function(_, p3) -- Document | line: 29
                -- upvalues: n1 (ref), Array (copy), Kind (copy)
                n1 = #Array.filter(p3.definitions, function(p4) -- line: 30
                    -- upvalues: Kind (copy)
                    return p4.kind == Kind.OPERATION_DEFINITION
                end)
            end,
            OperationDefinition = function(_, p6) -- OperationDefinition | line: 34
                -- upvalues: p1 (copy), n1 (ref), GraphQLError (copy)
                if not p6.name and n1 > 1 then
                    p1:reportError(GraphQLError.new("This anonymous operation must be the only defined operation.", p6))
                end
            end
        }
    end
}
