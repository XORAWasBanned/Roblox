-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.optimism.helpers
local v1 = script.Parent.Parent
local v2 = v1.Parent
require(v2.LuauPolyfill)
require(script.Parent.helpers_types)
return {
	["hasOwnProperty"] = require(v1.luaUtils.hasOwnProperty),
	["toArray"] = function(p3) -- name: toArray
		if p3._array then
			return table.clone(p3._array)
		end
		local v_u_4 = {}
		p3:forEach(function(p5)
			-- upvalues: (copy) v_u_4
			local v6 = v_u_4
			table.insert(v6, p5)
		end)
		return v_u_4
	end,
	["maybeUnsubscribe"] = function(p7) -- name: maybeUnsubscribe
		local v8 = p7.unsubscribe
		if type(v8) == "function" then
			p7.unsubscribe = nil
			v8()
		end
	end
}