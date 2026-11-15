-- Path: CoreGui.RobloxGui.Modules.FTUX.Utility.IsFTUXExperience
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
local v_u_3 = require(v1.Workspace.Packages.AppCommonLib).IsVRAppBuild
local v_u_4 = require(v2.Enums.PlatformEnum)
local v_u_5 = require(v2.Resources.FTUXConstants)
function IsFTUXExperience(p6) -- name: IsFTUXExperience
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
	if p6 ~= v_u_4.QuestVR then
		return false
	end
	local v7 = v_u_3()
	if v7 then
		local v8 = game.PlaceId
		v7 = tostring(v8) == v_u_5[v_u_4.QuestVR].ExperienceIds.PlaceId
	end
	return v7
end
return IsFTUXExperience