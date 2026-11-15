-- Path: CoreGui.RobloxGui.Modules.DevConsole.Util.setMouseVisibility
local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
return function(p3)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	if p3 then
		v_u_1.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceShow
		return
	elseif v_u_2.VREnabled then
		v_u_1.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
	else
		v_u_1.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
	end
end