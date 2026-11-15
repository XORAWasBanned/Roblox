-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.luaUtils.sortedEncode
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Object
local v_u_5 = game:GetService("HttpService")
function sortedEncode(p_u_6) -- name: sortedEncode
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	if v_u_3.isArray(p_u_6) or typeof(p_u_6) ~= "table" then
		return v_u_5:JSONEncode(p_u_6)
	end
	local v8 = v_u_3.map(v_u_3.sort(v_u_4.keys(p_u_6)), function(p7)
		-- upvalues: (ref) v_u_5, (copy) p_u_6
		return v_u_5:JSONEncode(p7) .. ":" .. sortedEncode(p_u_6[p7])
	end)
	return "{" .. v_u_3.join(v8, ",") .. "}"
end
return {
	["sortedEncode"] = sortedEncode
}