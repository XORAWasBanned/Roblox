-- Path: CoreGui.RobloxGui.Modules.SelfieView.Hooks.useLocalPlayer
local v1 = game:GetService("CorePackages").Packages
local v_u_2 = require(v1.React)
local v_u_3 = game:GetService("Players")
return function() -- name: useLocalPlayer
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return v_u_2.useMemo(function()
		-- upvalues: (ref) v_u_3
		local v4 = v_u_3.LocalPlayer
		while not v4 do
			v_u_3:GetPropertyChangedSignal("LocalPlayer"):Wait()
			v4 = v_u_3.LocalPlayer
		end
		local v5 = v4 ~= nil
		assert(v5)
		return v4
	end)
end