-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.observables.iteration
local v1 = script.Parent.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Array
local v3 = {}
require(script.Parent.Observable)
function v3.iterateObserversSafely(p4, p_u_5, p_u_6) -- name: iterateObserversSafely
	-- upvalues: (copy) v_u_2
	local v_u_7 = {}
	p4:forEach(function(p8)
		-- upvalues: (copy) p_u_5, (copy) v_u_7
		if p8[p_u_5] ~= nil then
			local v9 = v_u_7
			table.insert(v9, p8)
		end
	end)
	v_u_2.forEach(v_u_7, function(p10)
		-- upvalues: (copy) p_u_5, (copy) p_u_6
		p10[p_u_5](p10, p_u_6)
	end)
end
return v3