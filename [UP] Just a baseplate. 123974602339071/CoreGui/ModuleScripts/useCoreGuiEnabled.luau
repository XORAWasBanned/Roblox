-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Hooks.useCoreGuiEnabled
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("StarterGui")
local v_u_3 = require(v1.Packages.React)
function useCoreGuiEnabled(p_u_4) -- name: useCoreGuiEnabled
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v5, v_u_6 = v_u_3.useState(v_u_2:GetCoreGuiEnabled(p_u_4))
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_2, (copy) p_u_4, (copy) v_u_6
		local v_u_9 = v_u_2.CoreGuiChangedSignal:Connect(function(p7, p8)
			-- upvalues: (ref) p_u_4, (ref) v_u_6
			if p7 == p_u_4 then
				v_u_6(p8)
			end
		end)
		v_u_6(v_u_2:GetCoreGuiEnabled(p_u_4))
		return function()
			-- upvalues: (copy) v_u_9
			v_u_9:Disconnect()
		end
	end, { p_u_4 })
	return v5
end
return useCoreGuiEnabled