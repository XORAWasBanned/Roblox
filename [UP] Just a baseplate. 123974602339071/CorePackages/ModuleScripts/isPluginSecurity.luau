-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.isPluginSecurity
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Wrappers)
return function() -- name: isPluginSecurity
	-- upvalues: (copy) v_u_2
	local v_u_3 = v_u_2.Services.CoreGui
	local v4, _ = pcall(function()
		-- upvalues: (copy) v_u_3
		v_u_3:GetChildren()
	end)
	return v4
end