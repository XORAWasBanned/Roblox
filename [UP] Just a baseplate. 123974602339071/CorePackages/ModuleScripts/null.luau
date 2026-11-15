-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.globals.null
local v1 = script.Parent.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Boolean
local v_u_3 = {
	["__value"] = "null"
}
return {
	["NULL"] = v_u_3,
	["toJSBoolean"] = function(p4) -- name: toJSBoolean
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		local v5 = v_u_2.toJSBoolean(p4)
		if v5 then
			v5 = p4 ~= v_u_3
		end
		return v5
	end
}