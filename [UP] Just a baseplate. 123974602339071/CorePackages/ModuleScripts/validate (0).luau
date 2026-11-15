-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.validate
-- https://lua.expert

local Parent = script.Parent
local ParentParent = Parent.Parent
local ParentParent2 = ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Error = LuauPolyfill.Array, LuauPolyfill.Error
local devAssert = require(ParentParent.jsutils.devAssert).devAssert
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError

require(ParentParent.language.ast)
require(ParentParent.type.schema)

local visitor = require(ParentParent.language.visitor)
local visit, visitInParallel = visitor.visit, visitor.visitInParallel
local assertValidSchema = require(ParentParent.type.validate).assertValidSchema
local TypeInfo = require(ParentParent.utilities.TypeInfo)
local TypeInfo2, visitWithTypeInfo = TypeInfo.TypeInfo, TypeInfo.visitWithTypeInfo
local specifiedRules = require(Parent.specifiedRules)
local specifiedRules2, specifiedSDLRules = specifiedRules.specifiedRules, specifiedRules.specifiedSDLRules
local ValidationContext = require(Parent.ValidationContext)
local SDLValidationContext, ValidationContext2 = ValidationContext.SDLValidationContext, ValidationContext.ValidationContext
local t1 = {}

t1.validate = function(p1, p2, p3, p4, p5) -- line: 64
    -- upvalues: Array (copy), devAssert (copy), GraphQLError (copy), visit (copy), visitInParallel (copy), assertValidSchema (copy), TypeInfo2 (copy), visitWithTypeInfo (copy), specifiedRules2 (copy), ValidationContext2 (copy)
    p3 = p3 or specifiedRules2

    local v2 = p4 or {
        maxErrors = nil
    }
    local v3 = p5 or TypeInfo2.new(p1)

    devAssert(p2, "Must provide document.")
    assertValidSchema(p1)

    local t2 = {}
    local t3 = {}
    local v4 = ValidationContext2.new(p1, p2, v3, function(p6) -- line: 82
        -- upvalues: t2 (copy), t3 (copy), v2 (copy), GraphQLError (copy)
        if v2.maxErrors ~= nil and #t3 >= v2.maxErrors then
            table.insert(t3, GraphQLError.new("Too many validation errors, error limit reached. Validation aborted."))
            error(t2)
        end

        table.insert(t3, p6)
    end)
    local v5 = visitInParallel(Array.map(p3, function(p7) -- line: 98
        -- upvalues: v4 (copy)
        return p7(v4)
    end))

    local function v6() -- line: 103
        -- upvalues: p2 (copy), v3 (copy), v5 (copy), visit (copy), visitWithTypeInfo (copy)
        visit(p2, visitWithTypeInfo(v3, v5))
    end

    local ok, result = pcall(v6)

    if not ok and result ~= t2 then
        error(result)
    end

    return t3
end

t1.validateSDL = function(p8, p9, p10) -- line: 118
    -- upvalues: Array (copy), visit (copy), visitInParallel (copy), specifiedSDLRules (copy), SDLValidationContext (copy)
    p10 = p10 or specifiedSDLRules

    local t4 = {}
    local v8 = SDLValidationContext.new(p8, p9, function(p11) -- line: 126
        -- upvalues: t4 (copy)
        table.insert(t4, p11)
    end)

    visit(p8, visitInParallel((Array.map(p10, function(p12) -- line: 129
        -- upvalues: v8 (copy)
        return p12(v8)
    end))))

    return t4
end

t1.assertValidSDL = function(p13) -- line: 142
    -- upvalues: Array (copy), Error (copy), t1 (copy)
    local v10 = t1.validateSDL(p13)

    if #v10 ~= 0 then
        error(Error.new(table.concat(Array.map(v10, function(p14) -- line: 146
            return p14.message
        end), "\n\n")))
    end
end

t1.assertValidSDLExtension = function(p15, p16) -- line: 160
    -- upvalues: Array (copy), Error (copy), t1 (copy)
    local v11 = t1.validateSDL(p15, p16)

    if #v11 ~= 0 then
        error(Error.new(table.concat(Array.map(v11, function(p17) -- line: 164
            if typeof(p17) == "string" then
                return p17
            end

            return p17.message
        end), "\n\n")))
    end
end

return t1
