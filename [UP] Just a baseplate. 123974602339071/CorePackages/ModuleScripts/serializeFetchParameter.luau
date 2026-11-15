-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.http.serializeFetchParameter
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local ParentParent2 = ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Error, Array = LuauPolyfill.Error, LuauPolyfill.Array
local HttpService = game:GetService("HttpService")
local InvariantError = require(ParentParent.jsutils.invariant).InvariantError

return {
    serializeFetchParameter = function(p1, p2, p3) -- serializeFetchParameter | line: 27
        -- upvalues: Error (copy), Array (copy), HttpService (copy), InvariantError (copy)
        local v1

        local function v2() -- line: 29
            -- upvalues: p1 (copy), p3 (copy), v1 (ref), Array (copy), HttpService (copy)
            v1 = if Array.isArray(p1) and #p1 == 0 and p3 then "{}" else HttpService:JSONEncode(p1)
        end

        local ok, result = pcall(v2)

        if not ok then
            local v3 = InvariantError.new(("Network request failed. %s is not serializable: %s"):format(p2, result))

            v3.parseError = Error.new(result)
            error(v3)
        end

        return v1
    end
}
