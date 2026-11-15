-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Hooks.useNineDotActivityIndicator
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.Service)
return function(p_u_5, p_u_6)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_4, (copy) p_u_5, (copy) p_u_6
		v_u_4:setNineDotActivityIndicatorVisible(p_u_5, p_u_6)
		return function()
			-- upvalues: (ref) v_u_4, (ref) p_u_5
			v_u_4:setNineDotActivityIndicatorVisible(p_u_5, false)
		end
	end, { p_u_5, p_u_6 })
end