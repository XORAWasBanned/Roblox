-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Hooks.useMappedObservableValue
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
require(v1.Service.ChromeUtils)
return function(p_u_4, p_u_5)
	-- upvalues: (copy) v_u_3
	if not p_u_4 then
		warn("observableValue undefined")
		return nil
	end
	local v_u_6, v_u_7 = v_u_3.useState(p_u_5(p_u_4:get()))
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_4, (copy) v_u_7, (copy) p_u_5, (copy) v_u_6
		local v_u_8 = p_u_4:connect(function()
			-- upvalues: (ref) v_u_7, (ref) p_u_5, (ref) p_u_4
			v_u_7(p_u_5(p_u_4:get()))
		end)
		local v9 = p_u_5(p_u_4:get())
		if v_u_6 ~= v9 then
			v_u_7(v9)
		end
		return function()
			-- upvalues: (copy) v_u_8
			v_u_8:disconnect()
		end
	end, { p_u_4 })
	return v_u_6
end