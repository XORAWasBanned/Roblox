-- Path: CorePackages.Packages._Index.Dash.Dash.assign
local v1 = script.Parent
local v_u_2 = require(v1.None)
require(v1.Types)
local v_u_3 = require(v1.forEach)
local v_u_4 = require(v1.forEachArgs)
return function(p_u_5, ...) -- name: assign
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	v_u_4(function(p6)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) p_u_5
		if p6 ~= nil and p6 ~= v_u_2 then
			v_u_3(p6, function(p7, p8)
				-- upvalues: (ref) v_u_2, (ref) p_u_5
				if p7 == v_u_2 then
					p_u_5[p8] = nil
				else
					p_u_5[p8] = p7
				end
			end)
		end
	end, ...)
	return p_u_5
end