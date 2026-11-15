-- Path: CorePackages.Packages._Index.Dash.Dash.joinDeep
local v1 = script.Parent
local v_u_2 = require(v1.None)
require(v1.Types)
local v_u_3 = require(v1.forEach)
local function v_u_10(p_u_4, p5) -- name: joinDeep
	-- upvalues: (copy) v_u_3, (copy) v_u_10, (copy) v_u_2
	local v_u_6 = table.clone(p_u_4)
	v_u_3(p5, function(p7, p8)
		-- upvalues: (copy) p_u_4, (copy) v_u_6, (ref) v_u_10, (ref) v_u_2
		local v9 = p_u_4[p8]
		if typeof(v9) == "table" and typeof(p7) == "table" then
			v_u_6[p8] = v_u_10(p_u_4[p8], p7)
			return
		elseif p7 == v_u_2 then
			v_u_6[p8] = nil
		else
			v_u_6[p8] = p7
		end
	end)
	return v_u_6
end
return v_u_10