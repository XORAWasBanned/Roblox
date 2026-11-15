-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.GetCurrentHumanoidDescription
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.Promise)
return function()
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	return v_u_3.new(function(p4, p5)
		-- upvalues: (ref) v_u_2
		local function v6()
			-- upvalues: (ref) v_u_2
			return v_u_2:GetHumanoidDescriptionFromUserIdAsync(v_u_2.LocalPlayer.UserId)
		end
		local v7, v8 = pcall(v6)
		if v7 then
			p4(v8)
		else
			p5()
		end
	end)
end