-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.luaUtils.mapValueOrdered
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Map
return {
	["mapValueOrdered"] = function(p3, p4) -- name: mapValueOrdered
		-- upvalues: (copy) v_u_2
		local v5 = v_u_2.new()
		for _, v6 in p3 do
			local v7 = v6[1]
			v5:set(v7, p4(v6[2], v7))
		end
		return v5
	end
}