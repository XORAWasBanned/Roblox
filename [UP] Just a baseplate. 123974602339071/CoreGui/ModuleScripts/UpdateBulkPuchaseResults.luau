-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.UpdateBulkPuchaseResults
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux).makeActionCreator
require(v1.Workspace.Packages.AvatarExperienceInspectAndBuy)
return v2(script.Name, function(p3)
	return {
		["result"] = p3 or {}
	}
end)