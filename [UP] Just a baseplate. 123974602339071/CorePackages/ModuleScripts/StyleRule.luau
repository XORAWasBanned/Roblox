-- Path: CorePackages.Packages._Index.Foundation.Foundation.StyleSheet.StyleRule
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
return v_u_2.memo(function(p_u_3) -- name: StyleRule
	-- upvalues: (copy) v_u_2
	local v5 = v_u_2.useCallback(function(p4)
		-- upvalues: (copy) p_u_3
		if p4 ~= nil then
			p4:SetProperties(p_u_3.properties)
		end
	end, { p_u_3.properties })
	return v_u_2.createElement("StyleRule", {
		["Priority"] = p_u_3.Priority or 1,
		["Selector"] = p_u_3.Selector,
		["ref"] = v5
	})
end)