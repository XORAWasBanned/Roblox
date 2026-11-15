-- Path: CorePackages.Packages._Index.Dash.Dash.min
local v1 = script.Parent
local v_u_2 = require(v1.reduce)
local function v_u_5(p3, p4)
	return p3 < p4
end
return function(p6, p_u_7, p8) -- name: min
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	local v_u_9 = p8 or v_u_5
	if p_u_7 then
		return v_u_2(p6, function(p10, p11, p12)
			-- upvalues: (copy) p_u_7, (copy) v_u_9
			local v13 = p_u_7(p11, p12)
			return not p10 and {
				["value"] = v13,
				["original"] = p11
			} or (v_u_9(v13, p10.value) and {
				["value"] = v13,
				["original"] = p11
			} or p10)
		end, nil).original
	else
		return v_u_2(p6, function(p14, p15)
			-- upvalues: (copy) v_u_9
			if p14 then
				if v_u_9(p15, p14) then
					return p15
				else
					return p14
				end
			else
				return p15
			end
		end, nil)
	end
end