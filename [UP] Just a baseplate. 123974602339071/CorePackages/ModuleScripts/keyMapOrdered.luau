-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.luaUtils.keyMapOrdered
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Map
return {
	["keyMapOrdered"] = function(p3, p4) -- name: keyMapOrdered
		-- upvalues: (copy) v_u_2
		local v5 = v_u_2.new()
		for v6 = 1, #p3 do
			local v7 = p3[v6]
			v5:set(p4(v7), v7)
		end
		return v5
	end
}