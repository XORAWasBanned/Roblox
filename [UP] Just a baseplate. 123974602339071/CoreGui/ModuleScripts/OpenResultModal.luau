-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Actions.OpenResultModal
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["resultType"] = p2
	}
end)