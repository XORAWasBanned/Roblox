-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.luaUtils.isNillish
local v_u_1 = require(script.Parent.null)
return {
	["isNillish"] = function(p2) -- name: isNillish
		-- upvalues: (copy) v_u_1
		return p2 == nil and true or p2 == v_u_1
	end,
	["isNotNillish"] = function(p3) -- name: isNotNillish
		-- upvalues: (copy) v_u_1
		local v4
		if p3 == nil then
			v4 = false
		else
			v4 = p3 ~= v_u_1
		end
		return v4
	end
}