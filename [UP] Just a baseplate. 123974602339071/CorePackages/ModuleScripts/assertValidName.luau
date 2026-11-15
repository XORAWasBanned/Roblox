-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.assertValidName
-- https://lua.expert

local ParentParent = script.Parent.Parent
local devAssert = require(ParentParent.jsutils.devAssert).devAssert
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError
local isValidNameError

local function assertValidName(p1) -- line: 23
    -- upvalues: isValidNameError (ref)
    local v1 = isValidNameError(p1)

    if v1 then
        error(v1)
    end

    return p1
end

function isValidNameError(p2) -- line: 34
    -- upvalues: devAssert (copy), GraphQLError (copy)
    devAssert(type(p2) == "string", "Expected name to be a string.")

    if string.len(p2) > 1 and p2:sub(1, 1) == "_" and p2:sub(2, 2) == "_" then
        return GraphQLError.new("Name \"" .. p2 .. "\" must not begin with \"__\", which is reserved by GraphQL introspection.")
    end

    local v2, v3 = string.find(p2, "[_%a][_%a%d]*")

    if v2 == 1 and string.len(p2) == v3 then
        return nil
    end

    return GraphQLError.new("Names must match [_%a][_%a%d]* but \"" .. p2 .. "\" does not.")
end

return {
    assertValidName = assertValidName,
    isValidNameError = isValidNameError
}
