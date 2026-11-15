-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.common.filterInPlace
local v1 = script.Parent.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Array
return {
	["filterInPlace"] = function(p_u_3, p_u_4, p5) -- name: filterInPlace
		-- upvalues: (copy) v_u_2
		local v_u_6 = 1
		v_u_2.forEach(p_u_3, function(p7, p8)
			-- upvalues: (copy) p_u_4, (copy) p_u_3, (ref) v_u_6
			if p_u_4(p7, p8, p_u_3) then
				p_u_3[v_u_6] = p7
				v_u_6 = v_u_6 + 1
			end
		end, p5)
		p_u_3[v_u_6] = nil
		return p_u_3
	end
}