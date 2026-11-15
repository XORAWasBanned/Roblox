-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Utility.isInSelectInSceneReportMenuOverrideList
local v_u_1 = game:GetService("Players")
game:DefineFastString("SelectInSceneReportMenuOverrideUserIds", "")
function isInSelectInSceneReportMenuOverrideList() -- name: isInSelectInSceneReportMenuOverrideList
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1.LocalPlayer
	while not v2 do
		v_u_1:GetPropertyChangedSignal("LocalPlayer"):Wait()
		v2 = v_u_1.LocalPlayer
	end
	for v3 in game:GetFastString("SelectInSceneReportMenuOverrideUserIds"):gmatch("%d+") do
		if not v2 or tonumber(v3) ~= v2.UserId then
			continue
		end
		return true
	end
	return false
end
return isInSelectInSceneReportMenuOverrideList