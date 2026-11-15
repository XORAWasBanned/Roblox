-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.common.arrays
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent
local v_u_3 = require(v2.LuauPolyfill).Array
function v1.isNonEmptyArray(p_u_4) -- name: isNonEmptyArray
	-- upvalues: (copy) v_u_3
	return (function()
		-- upvalues: (ref) v_u_3, (copy) p_u_4
		if v_u_3.isArray(p_u_4) then
			return #p_u_4 > 0
		else
			return v_u_3.isArray(p_u_4)
		end
	end)()
end
return v1