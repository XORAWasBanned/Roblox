-- Path: CoreGui.RobloxGui.Modules.FTUX.Features.GetFeatures
local v1 = script.Parent.Parent
local v2 = v1.Features
local v_u_3 = require(v1.Enums.PlatformEnum)
local v_u_4 = require(v2.EnableSafetyBubbleDummy)
function GetFeatures(p5) -- name: GetFeatures
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	if p5 == v_u_3.QuestVR then
		v_u_4()
	end
end
return GetFeatures