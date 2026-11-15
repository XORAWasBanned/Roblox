-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Hooks.useWindowSizeIsLarge
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
return function(p_u_3)
	-- upvalues: (copy) v_u_2
	local v_u_4, v_u_5 = v_u_2.useState(p_u_3:getIsLarge())
	v_u_2.useEffect(function()
		-- upvalues: (copy) p_u_3, (copy) v_u_5, (copy) v_u_4
		local v_u_6 = p_u_3:connect(function()
			-- upvalues: (ref) v_u_5, (ref) p_u_3
			v_u_5(p_u_3:getIsLarge())
		end)
		if v_u_4 ~= p_u_3:getIsLarge() then
			v_u_5(p_u_3:getIsLarge())
		end
		return function()
			-- upvalues: (copy) v_u_6
			v_u_6:disconnect()
		end
	end, { p_u_3 })
	return v_u_4
end