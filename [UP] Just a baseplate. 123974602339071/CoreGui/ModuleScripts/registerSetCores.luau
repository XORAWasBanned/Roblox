-- Path: CoreGui.RobloxGui.Modules.InGameMenu.SetupFunctions.registerSetCores
local v_u_1 = game:GetService("StarterGui")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Actions.SetRespawnBehavior)
return function(p_u_4) -- name: registerSetCores
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	v_u_1:RegisterSetCore("ResetButtonCallback", function(p5)
		-- upvalues: (copy) p_u_4, (ref) v_u_3
		local v6 = true
		local v7 = nil
		if typeof(p5) == "boolean" then
			v6 = p5
			v7 = nil
		elseif typeof(p5) == "Instance" and p5:IsA("BindableEvent") then
			v7 = p5
			v6 = true
		else
			error("ResetButtonCallback must be set to a BindableEvent or a boolean", 0)
		end
		p_u_4:dispatch(v_u_3(v6, v7))
	end)
end