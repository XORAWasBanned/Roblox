-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.http.selectHttpOptionsAndBody
local v1 = script.Parent.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Boolean
local v_u_5 = v2.Object
local v6 = {}
local v_u_7 = require(v1.GraphQL).print
require(script.Parent.Parent.core.types)
local v_u_8 = nil
v6.fallbackHttpConfig = {
	["http"] = {
		["includeQuery"] = true,
		["includeExtensions"] = false
	},
	["headers"] = {
		["accept"] = "*/*",
		["content-type"] = "application/json"
	},
	["options"] = {
		["method"] = "POST"
	}
}
function v6.selectHttpOptionsAndBody(p9, p10, ...) -- name: selectHttpOptionsAndBody
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (ref) v_u_8, (copy) v_u_4, (copy) v_u_7
	local v_u_11 = v_u_5.assign({}, p10.options, {
		["headers"] = p10.headers,
		["credentials"] = p10.credentials
	})
	local v_u_12 = p10.http == nil and {} or p10.http
	v_u_3.forEach({ ... }, function(p13)
		-- upvalues: (ref) v_u_11, (ref) v_u_5, (ref) v_u_8, (ref) v_u_4, (ref) v_u_12
		v_u_11 = v_u_5.assign({}, v_u_11, p13.options, {
			["headers"] = v_u_5.assign({}, v_u_11.headers, v_u_8(p13.headers))
		})
		if v_u_4.toJSBoolean(p13.credentials) then
			v_u_11.credentials = p13.credentials
		end
		v_u_12 = v_u_5.assign({}, v_u_12, p13.http)
	end)
	local v14 = p9.operationName
	local v15 = p9.extensions
	local v16 = p9.variables
	local v17 = p9.query
	local v18 = {
		["operationName"] = v14,
		["variables"] = v16
	}
	if v_u_12.includeExtensions then
		v18.extensions = v15
	end
	if v_u_12.includeQuery then
		v18.query = v_u_7(v17)
	end
	return {
		["options"] = v_u_11,
		["body"] = v18
	}
end
v_u_8 = function(p_u_19) -- name: headersToLowerCase
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	if p_u_19 == nil then
		return p_u_19
	end
	local v_u_20 = {}
	v_u_3.forEach(v_u_5.keys(p_u_19), function(p21)
		-- upvalues: (copy) v_u_20, (copy) p_u_19
		v_u_20[string.lower(p21)] = p_u_19[p21]
	end)
	return v_u_20
end
return v6