-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.utils.throwServerError
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local ParentParent2 = ParentParent.Parent
local Error = require(ParentParent2.LuauPolyfill).Error

require(ParentParent.luaUtils.Response)

return {
    throwServerError = function(p1, p2, p3) -- throwServerError | line: 31
        -- upvalues: Error (copy)
        local v1 = Error.new(p3)

        v1.name = "ServerError"
        v1.response = p1
        v1.statusCode = p1.status
        v1.result = p2
        error(v1)
    end
}
