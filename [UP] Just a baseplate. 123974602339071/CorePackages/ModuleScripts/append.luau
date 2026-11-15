-- Path: CorePackages.Packages._Index.Dash.Dash.append
local v1 = script.Parent
local v_u_2 = require(v1.None)
local v_u_3 = require(v1.forEachArgs)
local v_u_4 = require(v1.forEach)
local v_u_5 = table.insert
return function(p_u_6, ...) -- name: append
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4, (copy) v_u_5
	v_u_3(function(p7)
		-- upvalues: (ref) v_u_2, (ref) v_u_4, (copy) p_u_6, (ref) v_u_5
		if p7 ~= v_u_2 and p7 ~= nil then
			v_u_4(p7, function(p8)
				-- upvalues: (ref) p_u_6, (ref) v_u_5
				v_u_5(p_u_6, p8)
			end)
		end
	end, ...)
	return p_u_6
end