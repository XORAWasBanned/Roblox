-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Hooks.useTopbarInsetHeight
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = require(v1.Packages.React)
return function()
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v4, v_u_5 = v_u_3.useState(v_u_2.TopbarInset.Height)
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_2, (copy) v_u_5
		local v_u_6 = v_u_2:GetPropertyChangedSignal("TopbarInset"):Connect(function()
			-- upvalues: (ref) v_u_5, (ref) v_u_2
			v_u_5(v_u_2.TopbarInset.Height)
		end)
		return function()
			-- upvalues: (copy) v_u_6
			v_u_6:Disconnect()
		end
	end, {})
	return v4
end