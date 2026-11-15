-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Actions.AddAnalyticsInfo
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["info"] = p2
	}
end)