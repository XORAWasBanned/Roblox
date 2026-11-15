-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.KnownArgumentNamesRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local ParentParent2 = ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Object = LuauPolyfill.Array, LuauPolyfill.Object
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local language, jsutils = ParentParent.language, ParentParent.jsutils
local didYouMean = require(jsutils.didYouMean).didYouMean
local suggestionList = require(jsutils.suggestionList).suggestionList
local Kind = require(language.kinds).Kind
local specifiedDirectives = require(ParentParent.type.directives).specifiedDirectives
local t1 = {}

function t1.KnownArgumentNamesRule(p1) -- line: 31
    -- upvalues: Array (copy), Object (copy), GraphQLError (copy), didYouMean (copy), suggestionList (copy), t1 (copy)
    return Object.assign({}, t1.KnownArgumentNamesOnDirectivesRule(p1), {
        Argument = function(_, p3) -- Argument | line: 33
            -- upvalues: p1 (copy), Array (copy), GraphQLError (copy), didYouMean (copy), suggestionList (copy)
            local v2 = p1:getArgument()
            local v3 = p1:getFieldDef()
            local v4 = p1:getParentType()

            if not v2 and v3 and v4 then
                local value = p3.name.value
                local v6 = suggestionList(value, (Array.map(v3.args, function(p4) -- line: 40
                    return p4.name
                end)))

                p1:reportError(GraphQLError.new(("Unknown argument \"%s\" on field \"%s.%s\"."):format(value, v4.name, v3.name) .. didYouMean(v6), p3))
            end
        end
    })
end

function t1.KnownArgumentNamesOnDirectivesRule(p5) -- line: 62
    -- upvalues: Array (copy), GraphQLError (copy), didYouMean (copy), suggestionList (copy), Kind (copy), specifiedDirectives (copy)
    local t4 = {}
    local v7 = p5:getSchema()
    local v8 = specifiedDirectives

    if v7 then
        v8 = v7:getDirectives()
    end

    for _, v9 in ipairs(v8) do
        t4[v9.name] = Array.map(v9.args, function(p6) -- line: 71
            return p6.name
        end)
    end

    local definitions = p5:getDocument().definitions

    for _, v10 in ipairs(definitions) do
        if v10.kind == Kind.DIRECTIVE_DEFINITION then
            local v11 = v10.arguments or {}

            t4[v10.name.value] = Array.map(v11, function(p7) -- line: 82
                return p7.name.value
            end)
        end
    end

    return {
        Directive = function(_, p9) -- Directive | line: 89
            -- upvalues: p5 (copy), t4 (copy), Array (copy), GraphQLError (copy), didYouMean (copy), suggestionList (copy)
            local value = p9.name.value
            local v12 = t4[value]

            if p9.arguments and v12 then
                for _, v13 in ipairs(p9.arguments) do
                    local value2 = v13.name.value

                    if Array.indexOf(v12, value2) == -1 then
                        local v14 = suggestionList(value2, v12)

                        p5:reportError(GraphQLError.new(("Unknown argument \"%s\" on directive \"@%s\"."):format(value2, value) .. didYouMean(v14), v13))
                    end
                end
            end

            return false
        end
    }
end

return t1
