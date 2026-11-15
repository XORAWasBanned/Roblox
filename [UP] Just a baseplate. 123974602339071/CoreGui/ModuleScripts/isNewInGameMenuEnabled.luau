-- Path: CoreGui.RobloxGui.Modules.isNewInGameMenuEnabled
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("VRService")
local v3 = game:GetService("CorePackages")
local v4 = require(v3.Workspace.Packages.SharedFlags)
game:DefineFastInt("NewInGameMenuPercentRollout3", 0)
game:DefineFastString("NewInGameMenuForcedUserIds", "")
game:DefineFastFlag("NewInGameMenuDisabledInVR", false)
game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = v4.isSubjectToDesktopPolicies
local v_u_5 = require(v3.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
return function()
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_1
	if v_u_2.VREnabled then
		return not v_u_5
	end
	local v6 = v_u_1.LocalPlayer
	while not v6 do
		v_u_1:GetPropertyChangedSignal("LocalPlayer"):Wait()
		v6 = v_u_1.LocalPlayer
	end
	for v7 in game:GetFastString("NewInGameMenuForcedUserIds"):gmatch("%d+") do
		if tonumber(v7) ~= v6.UserId then
			continue
		end
		return true
	end
	return game:GetFastInt("NewInGameMenuPercentRollout3") > v6.UserId % 100 and true or false
end