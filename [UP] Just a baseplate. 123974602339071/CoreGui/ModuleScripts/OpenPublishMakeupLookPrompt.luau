-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Actions.OpenPublishMakeupLookPrompt
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3, p4, p5)
	local v6 = {
		["promptInfo"] = {
			["promptType"] = p2,
			["guid"] = p3,
			["scopes"] = p4,
			["makeupEntries"] = p5
		}
	}
	return v6
end)