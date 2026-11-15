-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.http.parseAndCheckHttpResponse
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local ParentParent2 = ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Error = LuauPolyfill.Array, LuauPolyfill.Error

require(ParentParent.luaUtils.Response)

local HttpService = game:GetService("HttpService")
local t1 = {}

require(script.Parent.Parent.core.types)

local throwServerError = require(script.Parent.Parent.utils).throwServerError
local hasOwnProperty = require(ParentParent.luaUtils.hasOwnProperty)

function t1.parseAndCheckHttpResponse(p1) -- line: 34
    -- upvalues: Array (copy), Error (copy), HttpService (copy), throwServerError (copy), hasOwnProperty (copy)
    return function(p2) -- line: 35
        -- upvalues: p1 (copy), Array (copy), Error (copy), HttpService (copy), throwServerError (copy), hasOwnProperty (copy)
        return p2:text():andThen(function(p3) -- line: 38
            -- upvalues: p2 (copy), Error (copy), HttpService (copy)
            local function v1() -- line: 39
                -- upvalues: p3 (copy), HttpService (copy)
                return HttpService:JSONDecode(p3), true
            end

            local ok, result = pcall(v1)

            if not ok then
                local v2 = Error.new(result)

                v2.name = "ServerParseError"
                v2.response = p2
                v2.statusCode = p2.status
                v2.bodyText = p3
                error(v2)
            end

            return result
        end):andThen(function(p4) -- line: 54
            -- upvalues: p2 (copy), p1 (copy), Array (copy), throwServerError (copy), hasOwnProperty (copy)
            if p2.status ~= nil and p2.status >= 300 then
                throwServerError(p2, p4, ("Response not successful: Received status code %s"):format((tostring(p2.status))))
            end

            if not (Array.isArray(p4) or hasOwnProperty(p4, "data") or hasOwnProperty(p4, "errors")) then
                throwServerError(p2, p4, ("Server response was missing for query '%s'."):format(Array.isArray(p1) and Array.join(Array.map(p1, function(p5) -- line: 77
                    return p5.operationName
                end), ", ") or p1.operationName))
            end

            return p4
        end)
    end
end

return t1
