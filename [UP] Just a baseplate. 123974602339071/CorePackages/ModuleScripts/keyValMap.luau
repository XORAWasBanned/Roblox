-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.keyValMap
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Map
return {
	["keyValMap"] = function(p3, p4, p5) -- name: keyValMap
		-- upvalues: (copy) v_u_2
		local v6 = v_u_2.new()
		for _, v7 in ipairs(p3) do
			v6:set(p4(v7), p5(v7))
		end
		return v6
	end
}