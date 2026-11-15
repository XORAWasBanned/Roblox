-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getBuilderIconForKeycode.getBuilderIconForKeycode
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.BuilderIcons).getBuilderIconForKeycode
return function(p_u_3)
	-- upvalues: (copy) v_u_2
	local function v4()
		-- upvalues: (ref) v_u_2, (copy) p_u_3
		return v_u_2(p_u_3)
	end
	local v5, v6 = pcall(v4)
	if v5 then
		return v6
	else
		return nil
	end
end