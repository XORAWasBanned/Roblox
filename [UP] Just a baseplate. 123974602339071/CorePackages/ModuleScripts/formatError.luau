-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.error.formatError
-- https://lua.expert

local ParentParent = script.Parent.Parent
local ParentParent2 = ParentParent.Parent

require(ParentParent2.LuauPolyfill)

local devAssert = require(ParentParent.jsutils.devAssert).devAssert

require(ParentParent.language.location)
require(script.Parent.GraphQLError)

return {
    formatError = function(p1) -- line: 25
        -- upvalues: devAssert (copy)
        devAssert(p1, "Received nil error.")

        local message = p1.message
        local v1 = if message then string.len(p1.message) > 0 else nil
        local v2 = if not message or not v1 then "An unknown error occurred." else p1.message
        local locations, path, extensions = p1.locations, p1.path, p1.extensions

        return extensions and {
            message = v2,
            locations = locations,
            path = path,
            extensions = extensions
        } or {
            message = v2,
            locations = locations,
            path = path
        }
    end
}
